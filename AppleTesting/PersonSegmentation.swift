//
//  PersonSegmentation.swift
//  AppleTesting
//
//  Created by Hassan Alkhafaji on 2/20/25.
//

import SwiftUI
import Vision





struct PersonSegmentation: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func showImageMask(url: Image) -> CVPixelBuffer {
        let request = VNGeneratePersonSegmentationRequest()
        
        var imageURL = URL(fileURLWithPath: url.fileExporterFilenameLabel)
        
        
        let requestHandler = VNImageRequestHandler(url: imageURL, options: choices)

        let mask = request.results!.first!
        let maskBuffer = mask.pixelBuffer
        return maskBuffer
    }
}

#Preview {
    PersonSegmentation()
}
