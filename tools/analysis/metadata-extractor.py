#!/usr/bin/env python3
"""
Metadata Extractor - 516 Hackers Toolkit
Extracts metadata from various file types
"""

import os
import sys
import json
import argparse
from pathlib import Path
from datetime import datetime

try:
    from PIL import Image
    from PIL.ExifTags import TAGS
    HAS_PIL = True
except ImportError:
    HAS_PIL = False

try:
    import pdfplumber
    HAS_PDF = True
except ImportError:
    HAS_PDF = False

class MetadataExtractor:
    def __init__(self):
        self.results = {}
        
    def extract_image_metadata(self, file_path):
        """Extract metadata from image files"""
        if not HAS_PIL:
            return {"error": "PIL/Pillow not installed"}
            
        try:
            image = Image.open(file_path)
            info = {
                "format": image.format,
                "mode": image.mode,
                "size": image.size,
                "info": image.info
            }
            
            # Extract EXIF data
            exif_data = {}
            if hasattr(image, '_getexif') and image._getexif():
                for tag_id, value in image._getexif().items():
                    tag = TAGS.get(tag_id, tag_id)
                    exif_data[tag] = str(value)
                
            info["exif"] = exif_data
            return info
            
        except Exception as e:
            return {"error": str(e)}
    
    def extract_pdf_metadata(self, file_path):
        """Extract metadata from PDF files"""
        if not HAS_PDF:
            return {"error": "pdfplumber not installed"}
            
        try:
            with pdfplumber.open(file_path) as pdf:
                info = {
                    "pages": len(pdf.pages),
                    "metadata": pdf.metadata
                }
                return info
        except Exception as e:
            return {"error": str(e)}
    
    def extract_basic_metadata(self, file_path):
        """Extract basic file system metadata"""
        stat = os.stat(file_path)
        return {
            "size": stat.st_size,
            "created": datetime.fromtimestamp(stat.st_ctime).isoformat(),
            "modified": datetime.fromtimestamp(stat.st_mtime).isoformat(),
            "accessed": datetime.fromtimestamp(stat.st_atime).isoformat()
        }
    
    def analyze_file(self, file_path):
        """Main analysis function"""
        file_path = Path(file_path)
        
        if not file_path.exists():
            return {"error": "File not found"}
        
        self.results = {
            "filename": file_path.name,
            "path": str(file_path.absolute()),
            "basic": self.extract_basic_metadata(file_path)
        }
        
        # File type specific extraction
        if file_path.suffix.lower() in ['.jpg', '.jpeg', '.png', '.tiff', '.bmp']:
            self.results["image_metadata"] = self.extract_image_metadata(file_path)
        elif file_path.suffix.lower() == '.pdf':
            self.results["pdf_metadata"] = self.extract_pdf_metadata(file_path)
        
        return self.results

def main():
    parser = argparse.ArgumentParser(description='Metadata Extractor - 516 Hackers Toolkit')
    parser.add_argument('file', help='File to analyze')
    parser.add_argument('-o', '--output', help='Output file (JSON)')
    
    args = parser.parse_args()
    
    print("[516] Metadata Extractor - Starting analysis")
    
    extractor = MetadataExtractor()
    results = extractor.analyze_file(args.file)
    
    # Output results
    if args.output:
        with open(args.output, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"[516] Results saved to: {args.output}")
    else:
        print(json.dumps(results, indent=2))
    
    print("[516] Analysis completed")

if __name__ == "__main__":
    main()
