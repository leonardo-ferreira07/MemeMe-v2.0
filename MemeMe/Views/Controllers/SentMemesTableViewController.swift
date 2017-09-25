//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 25/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UIViewController {

    enum MemeTableCell: String {
        case tableMeme
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let meme = Meme.init(topText: "a", bottomText: "b", originalImage: UIImage(named: "LaunchImage")!, memeImage: UIImage(named: "LaunchImage")!)
        
        Memes.shared.memesArray.append(contentsOf: [meme, meme, meme, meme, meme, meme, meme, meme, meme, meme, meme, meme, meme, meme, meme, meme, meme, meme])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? MemeDetailViewController {
            if let meme = sender as? Meme {
                controller.meme = meme
            }
        }
    }
    
}

// MARK: - TableView Delegate and Data Source

extension SentMemesTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Memes.shared.memesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MemeTableCell.tableMeme.rawValue, for: indexPath) as? SentMemeTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? SentMemeTableViewCell {
            cell.confugureCell(with: Memes.shared.memesArray[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showMemeDetail", sender: Memes.shared.memesArray[indexPath.row])
    }
    
}
