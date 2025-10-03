#!/usr/bin/env python3
"""
OSINT Lookup Tool - 516 Hackers Toolkit
Multiple OSINT source checks in one tool
"""

import requests
import json
import sys
import argparse
from datetime import datetime
from pathlib import Path

class OSINTLookup:
    def __init__(self):
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (compatible; 516-Hackers-Toolkit/1.0)'
        })
        self.results = {}
    
    def check_ip(self, ip_address):
        """Check IP against various OSINT sources"""
        ip_info = {}
        
        try:
            # IPAPI.co
            response = self.session.get(f'http://ipapi.co/{ip_address}/json/')
            if response.status_code == 200:
                ip_info['ipapi'] = response.json()
            
            # AbuseIPDB (requires API key)
            ip_info['abuseipdb'] = {'note': 'API key required for full check'}
            
        except Exception as e:
            ip_info['error'] = str(e)
            
        return ip_info
    
    def check_domain(self, domain):
        """Check domain against various sources"""
        domain_info = {}
        
        try:
            # SecurityTrails (requires API key)
            domain_info['securitytrails'] = {'note': 'API key required'}
            
            # Basic DNS info
            import socket
            domain_info['dns'] = {
                'ip': socket.gethostbyname(domain)
            }
            
        except Exception as e:
            domain_info['error'] = str(e)
            
        return domain_info
    
    def check_email(self, email):
        """Check email against breach databases"""
        email_info = {}
        
        try:
            # Have I Been Pwned (requires API key)
            email_info['hibp'] = {'note': 'API key required for full check'}
            
        except Exception as e:
            email_info['error'] = str(e)
            
        return email_info
    
    def lookup(self, target, target_type="auto"):
        """Main lookup function"""
        print(f"[516] OSINT Lookup - Analyzing: {target}")
        
        if target_type == "auto":
            if "@" in target:
                target_type = "email"
            elif "." in target and not any(c.isalpha() for c in target.split('.')[0]):
                target_type = "ip"
            else:
                target_type = "domain"
        
        if target_type == "ip":
            self.results = self.check_ip(target)
        elif target_type == "domain":
            self.results = self.check_domain(target)
        elif target_type == "email":
            self.results = self.check_email(target)
        else:
            self.results = {"error": "Unknown target type"}
        
        self.results['lookup_type'] = target_type
        self.results['timestamp'] = datetime.now().isoformat()
        
        return self.results

def main():
    parser = argparse.ArgumentParser(description='OSINT Lookup - 516 Hackers Toolkit')
    parser.add_argument('target', help='Target to investigate (IP, domain, email)')
    parser.add_argument('-t', '--type', choices=['auto', 'ip', 'domain', 'email'], 
                       default='auto', help='Target type')
    parser.add_argument('-o', '--output', help='Output file (JSON)')
    
    args = parser.parse_args()
    
    print("[516] OSINT Lookup Tool - Starting investigation")
    print("[516] Legal: Only use on authorized targets")
    
    lookup = OSINTLookup()
    results = lookup.lookup(args.target, args.type)
    
    # Output results
    if args.output:
        output_path = Path(args.output)
        with open(output_path, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"[516] Results saved to: {output_path}")
    else:
        print(json.dumps(results, indent=2))
    
    print("[516] OSINT investigation completed")

if __name__ == "__main__":
    main()
