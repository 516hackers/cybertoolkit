
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
    print("  Kali/Termux: pip install theharvester")
    print("  Or clone from: https://github.com/laramies/theHarvester")
    return False

def get_log_directory():
    """Get the correct log directory path with fallbacks"""
    # 1. Check environment variable first
    env_log_dir = os.getenv('CYBERTOOLKIT_LOG_DIR')
    if env_log_dir:
        log_dir = Path(env_log_dir)
        log_dir.mkdir(exist_ok=True)
        return log_dir.resolve()
    
    # 2. Check for logs directory in project root
    script_dir = Path(__file__).parent
    project_root = script_dir.parent.parent
    log_dir = project_root / "logs"
    
    try:
        log_dir.mkdir(exist_ok=True)
        return log_dir.resolve()
    except (PermissionError, OSError):
        pass
    
    # 3. Fallback to current directory
    current_logs = Path("./logs")
    current_logs.mkdir(exist_ok=True)
    return current_logs.resolve()

def main():
    parser = argparse.ArgumentParser(description='theHarvester Wrapper - 516 Hackers Toolkit')
    parser.add_argument('-d', '--domain', required=True, help='Target domain')
    parser.add_argument('-s', '--source', default='all', help='Data sources')
    parser.add_argument('-l', '--limit', type=int, default=500, help='Limit results')
    
    args = parser.parse_args()
    
    # Get the correct log directory
    log_dir = get_log_directory()
    log_file = log_dir / f"theharvester_{args.domain}_{os.getpid()}.log"
    
    print(f"[516] Starting theHarvester scan for: {args.domain}")
    print(f"[516] Platform: {sys.platform}")
    print(f"[516] Log directory: {log_dir}")
    
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
            log.write(f"[516] Command: {' '.join(cmd)}\n")
            log.write(f"[516] Platform: {sys.platform}\n")
            log.write(f"[516] Log file: {log_file}\n\n")
            
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
