//
//  SentMemeCollectionViewCell.swift
//  MemeMe
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 25/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import UIKit

class SentMemeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var memeImageView: UIImageView!
    
}

// MARK: - Configure cell

extension SentMemeCollectionViewCell {
    func confugureCell(with meme: Meme) {
        memeImageView.image = meme.memeImage
    }
}
