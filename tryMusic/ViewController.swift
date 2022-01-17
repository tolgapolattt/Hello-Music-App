//
//  ViewController.swift
//  tryMusic
//
//  Created by Tolga Polat on 16.01.2022.
//

import UIKit




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    lazy var table: UITableView = {
           let v = UITableView()
           v.rowHeight = 100
           v.separatorStyle = .none
           return v
       }()
    var songs = [Song]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
   }
    func configureSongs(){
        songs.append(Song(name: "Ben Kimim",
                          albumName: "Ludovico",
                          artistName: "Şanışer",
                          imageName: "cover1",
                          trackName: "1"))
        songs.append(Song(name: "Pembe Mezarlık",
                          albumName: "Çilek",
                          artistName: "Model",
                          imageName: "cover2",
                          trackName: "2"))
        songs.append(Song(name: "Serseriyim Ben",
                          albumName: "İstiklal",
                          artistName: "Teoman",
                          imageName: "cover3",
                          trackName: "3"))
        songs.append(Song(name: "Ben Kimim",
                          albumName: "Ludovico",
                          artistName: "Şanışer",
                          imageName: "cover1",
                          trackName: "1"))
        songs.append(Song(name: "Pembe Mezarlık",
                          albumName: "Çilek",
                          artistName: "Model",
                          imageName: "cover2",
                          trackName: "2"))
        songs.append(Song(name: "Serseriyim Ben",
                          albumName: "İstiklal",
                          artistName: "Teoman",
                          imageName: "cover3",
                          trackName: "3"))
        songs.append(Song(name: "Ben Kimim",
                          albumName: "Ludovico",
                          artistName: "Şanışer",
                          imageName: "cover1",
                          trackName: "1"))
        songs.append(Song(name: "Pembe Mezarlık",
                          albumName: "Çilek",
                          artistName: "Model",
                          imageName: "cover2",
                          trackName: "2"))
        songs.append(Song(name: "Serseriyim Ben",
                          albumName: "İstiklal",
                          artistName: "Teoman",
                          imageName: "cover3",
                          trackName: "3"))
        songs.append(Song(name: "Ben Kimim",
                          albumName: "Ludovico",
                          artistName: "Şanışer",
                          imageName: "cover1",
                          trackName: "1"))
        songs.append(Song(name: "Pembe Mezarlık",
                          albumName: "Çilek",
                          artistName: "Model",
                          imageName: "cover2",
                          trackName: "2"))
        songs.append(Song(name: "Serseriyim Ben",
                          albumName: "İstiklal",
                          artistName: "Teoman",
                          imageName: "cover3",
                          trackName: "3"))
        
    }
    //MARK TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       //configure
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvatica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvatica", size: 17)

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else{
            return
        }
        vc.songs = songs
        vc.position = position
       present(vc, animated: true)
    }
    
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

