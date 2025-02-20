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
    
    func showImageMask(from imageURL: URL) -> CVPixelBuffer? {
        
        let request = VNGeneratePersonSegmentationRequest()
        let requestHandler = VNImageRequestHandler(url: imageURL, options: [:])
        
        do {
            try requestHandler.perform([request])
        } catch {
            print("Error performing request: \(error)")
        }

        guard let mask = request.results?.first as? VNPixelBufferObservation else { return nil}
        
        return mask.pixelBuffer
    }
}

#Preview {
    PersonSegmentation()
}
