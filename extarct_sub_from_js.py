import re
import requests
import sys
from urllib.parse import urlparse

def extract_domains(js_content):
    # Regular expression to find domain-like patterns
    domain_pattern = re.compile(r'([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})')
    return re.findall(domain_pattern, js_content)

def get_js_content(url):
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.text
    except requests.RequestException as e:
        print(f"Error fetching JavaScript content: {e}")
        sys.exit(1)

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 script.py <js-url>")
        sys.exit(1)
    
    url = sys.argv[1]
    js_content = get_js_content(url)
    domains = extract_domains(js_content)

    # Extract and print unique domains
    unique_domains = set()
    for domain in domains:
        parsed_domain = urlparse(f"http://{domain}").netloc
        if parsed_domain:
            unique_domains.add(parsed_domain)

    for domain in unique_domains:
        print(domain)

if __name__ == "__main__":
    main()
