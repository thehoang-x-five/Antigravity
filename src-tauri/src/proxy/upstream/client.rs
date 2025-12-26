// 上游客户端实现
// 基于高性能通讯接口封装

use reqwest::{header, Client, Response};
use serde_json::Value;
use tokio::time::Duration;

// 生产环境端点
const V1_INTERNAL_BASE_URL: &str = "https://cloudcode-pa.googleapis.com/v1internal";

pub struct UpstreamClient {
    http_client: Client,
}

impl UpstreamClient {
    pub fn new(proxy_config: Option<crate::proxy::config::UpstreamProxyConfig>) -> Self {
        let mut builder = Client::builder()
            .timeout(Duration::from_secs(600))
            .user_agent("antigravity/1.11.9 windows/amd64");

        if let Some(config) = proxy_config {
            if config.enabled && !config.url.is_empty() {
                if let Ok(proxy) = reqwest::Proxy::all(&config.url) {
                    builder = builder.proxy(proxy);
                    tracing::info!("UpstreamClient enabled proxy: {}", config.url);
                }
            }
        }

        let http_client = builder.build().expect("Failed to create HTTP client");

        Self { http_client }
    }

    /// 构建 v1internal URL
    /// 
    /// 构建 API 请求地址
    fn build_url(method: &str, query_string: Option<&str>) -> String {
        if let Some(qs) = query_string {
            format!("{}:{}?{}", V1_INTERNAL_BASE_URL, method, qs)
        } else {
            format!("{}:{}", V1_INTERNAL_BASE_URL, method)
        }
    }

    /// 调用 v1internal API（基础方法）
    /// 
    /// 发起基础网络请求
    pub async fn call_v1_internal(
        &self,
        method: &str,
        access_token: &str,
        body: Value,
        query_string: Option<&str>,
    ) -> Result<Response, String> {
        let url = Self::build_url(method, query_string);

        // 构建 Headers
        let mut headers = header::HeaderMap::new();
        headers.insert(header::CONTENT_TYPE, header::HeaderValue::from_static("application/json"));
        headers.insert(header::AUTHORIZATION, header::HeaderValue::from_str(&format!("Bearer {}", access_token)).map_err(|e| e.to_string())?);
        // 设置自定义 User-Agent
        headers.insert(header::USER_AGENT, header::HeaderValue::from_static("antigravity/1.11.9 windows/amd64"));

        // 记录请求详情以便调试 404
        let response = self
            .http_client
            .post(&url)
            .headers(headers) // Apply all headers at once
            .json(&body)
            .send()
            .await
            .map_err(|e| format!("HTTP request failed: {}", e))?;

        Ok(response)
    }

    /// 调用 v1internal API（带 429 重试,支持闭包）
    /// 
    /// 带容错和重试的核心请求逻辑
    /// 
    /// # Arguments
    /// * `method` - API method (e.g., "generateContent")
    /// * `query_string` - Optional query string (e.g., "?alt=sse")
    /// * `get_credentials` - 闭包，获取凭证（支持账号轮换）
    /// * `build_body` - 闭包，接收 project_id 构建请求体
    /// * `max_attempts` - 最大重试次数
    /// 
    /// # Returns
    /// HTTP Response
    // 已移除弃用的重试方法 (call_v1_internal_with_retry)

    // 已移除弃用的辅助方法 (parse_retry_delay)

    // 已移除弃用的辅助方法 (parse_duration_ms)

    /// 获取可用模型列表
    /// 
    /// 获取远端模型列表
    pub async fn fetch_available_models(&self, access_token: &str) -> Result<Value, String> {
        let url = Self::build_url("fetchAvailableModels", None);

        let mut headers = header::HeaderMap::new();
        headers.insert(header::CONTENT_TYPE, header::HeaderValue::from_static("application/json"));
        headers.insert(header::AUTHORIZATION, header::HeaderValue::from_str(&format!("Bearer {}", access_token)).map_err(|e| e.to_string())?);
        headers.insert(header::USER_AGENT, header::HeaderValue::from_static("antigravity/1.11.9 windows/amd64"));

        let response = self.http_client
            .post(&url)
            .headers(headers)
            .json(&serde_json::json!({}))
            .send()
            .await
            .map_err(|e| format!("Request failed: {}", e))?;

        if !response.status().is_success() {
             return Err(format!("Upstream error: {}", response.status()));
        }

        let json: Value = response.json().await.map_err(|e| format!("Parse json failed: {}", e))?;
        Ok(json)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_build_url() {
        let url1 = UpstreamClient::build_url("generateContent", None);
        assert_eq!(
            url1,
            "https://cloudcode-pa.googleapis.com/v1internal:generateContent"
        );

        let url2 = UpstreamClient::build_url("streamGenerateContent", Some("alt=sse"));
        assert_eq!(
            url2,
            "https://cloudcode-pa.googleapis.com/v1internal:streamGenerateContent?alt=sse"
        );
    }

}
