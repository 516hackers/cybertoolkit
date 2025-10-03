#!/usr/bin/env python3
"""
theHarvester Wrapper - 516 Hackers Toolkit
Legal: Only use on authorized targets
"""

import sys
import os
import subprocess
import argparse
from pathlib import Path

def check_theharvester():
    """Check if theHarvester is available"""
    try:
        subprocess.run([sys.executable, "-m", "theHarvester", "-h"], 
                      capture_output=True, check=False)
        return True
    except (subprocess.SubprocessError, ImportError):
        return False

def install_theharvester():
    """Provide installation instructions"""
    print("[516] theHarvester not found. Install with:")
    print("  pip install theharvester")
    print("  Or clone from: https://github.com/laramies/theHarvester")
    return False

def main():
    parser = argparse.ArgumentParser(description='theHarvester Wrapper - 516 Hackers Toolkit')
    parser.add_argument('-d', '--domain', required=True, help='Target domain')
    parser.add_argument('-s', '--source', default='all', help='Data sources')
    parser.add_argument('-l', '--limit', type=int, default=500, help='Limit results')
    
    args = parser.parse_args()
    
    # Setup logging
    log_dir = Path("../../logs")
    log_dir.mkdir(exist_ok=True)
    log_file = log_dir / f"theharvester_{args.domain}_{os.getpid()}.log"
    
    print(f"[516] Starting theHarvester scan for: {args.domain}")
    
    if not check_theharvester():
        install_theharvester()
        sys.exit(1)
    
    cmd = [
        sys.executable, "-m", "theHarvester",
        "-d", args.domain,
        "-b", args.source,
        "-l", str(args.limit)
    ]
    
    try:
        with open(log_file, 'w') as log:
            log.write(f"[516] theHarvester Scan for {args.domain}\n")
            log.write(f"[516] Command: {' '.join(cmd)}\n\n")
            
            process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
            
            for line in process.stdout:
                print(line, end='')
                log.write(line)
            
            process.wait()
            
        print(f"[516] Scan completed. Log saved to: {log_file}")
        
    except Exception as e:
        print(f"[516] Error during scan: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
