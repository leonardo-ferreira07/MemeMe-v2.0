//
//  MemeHelper.swift
//  MemeMe
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import UIKit

struct MemeHelper {
    
    static func save(topText: String, bottomText: String, originalImage: UIImage, memeImage: UIImage, editMemeInstance: Meme? = nil) {
        
        if topText.characters.count > 0 && bottomText.characters.count > 0 {
            
            if let meme = editMemeInstance {
                let containsSameMeme = Memes.shared.memesArray.contains { $0.memeImage == meme.memeImage }
                if containsSameMeme {
                    let index = Memes.shared.memesArray.index { $0.memeImage == meme.memeImage }
                    let memeEqual = Meme(topText: topText, bottomText: bottomText, originalImage: originalImage, memeImage: memeImage)
                    Memes.shared.memesArray[index!] = memeEqual
                    return
                }
            }
            
            let meme = Meme(topText: topText, bottomText: bottomText, originalImage: originalImage, memeImage: memeImage)
            Memes.shared.memesArray.append(meme)
        }
    }
    
    static func generateMemedImage(_ viewController: PickImageViewController) -> UIImage {
        
        verifyViewControllerBars(true, viewController: viewController)
        
        // Render view to an image
        UIGraphicsBeginImageContext(viewController.view.frame.size)
        viewController.view.drawHierarchy(in: viewController.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        verifyViewControllerBars(false, viewController: viewController)
        
        return memedImage
    }
    
    private static func verifyViewControllerBars(_ enabled: Bool, viewController: PickImageViewController) {
        viewController.topBar.isHidden = enabled
        viewController.bottomBar.isHidden = enabled
    }
    
}
