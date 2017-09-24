//
//  Memes.swift
//  MemeMe
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 24/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import Foundation

class Memes {
    
    static let shared = Memes()
 
    private init() {}
    
    var memesArray: [Meme] = []
}
