//
//  PersonSegmentation.swift
//  AppleTesting
//
//  Created by Hassan Alkhafaji on 2/20/25.
//

import SwiftUI
import Vision
import PhotosUI


struct PersonSegmentation: View {
    
    @State var photoPickerItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            
            
            PhotosPicker("Choose an image to mask people", selection: $photoPickerItem)
      
            
            
        }
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
