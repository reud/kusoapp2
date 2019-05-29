//
//  SpotifyTestViewController.swift
//  kusoapp2
//
//  Created by reiji kobayashi on 2019/05/29.
//  Copyright © 2019 reud. All rights reserved.
//

import UIKit
import SpotifyKit
import Alamofire

public struct Result: Codable {
    public let context: Context
    public let timestamp: Int
    public let progressMs: Int
    public let isPlaying: Bool
    public let currentlyPlayingType: String
    public let actions: Actions
    public let item: Item
    
    public struct Context: Codable {
        public let externalUrls: ExternalUrls
        public let href: String
        public let type: String
        public let uri: String
        
        public struct ExternalUrls: Codable {
            public let spotify: String
        }
        
        private enum CodingKeys: String, CodingKey {
            case externalUrls = "external_urls"
            case href
            case type
            case uri
        }
    }
    
    public struct Actions: Codable {
        public let disallows: Disallows
        
        public struct Disallows: Codable {
            public let resuming: Bool
        }
    }
    
    public struct Item: Codable {
        public let album: Album
        public let artists: [Artists]
        public let availableMarkets: [String]
        public let discNumber: Int
        public let durationMs: Int
        public let explicit: Bool
        public let externalIds: ExternalIds
        public let externalUrls: ExternalUrls
        public let href: String
        public let id: String
        public let name: String
        public let popularity: Int
        public let previewUrl: String
        public let trackNumber: Int
        public let type: String
        public let uri: String
        
        public struct Album: Codable {
            public let albumType: String
            public let externalUrls: ExternalUrls
            public let href: String
            public let id: String
            public let images: [Images]
            public let name: String
            public let type: String
            public let uri: String
            
            public struct ExternalUrls: Codable {
                public let spotify: String
            }
            
            public struct Images: Codable {
                public let height: Int
                public let url: String
                public let width: Int
            }
            
            private enum CodingKeys: String, CodingKey {
                case albumType = "album_type"
                case externalUrls = "external_urls"
                case href
                case id
                case images
                case name
                case type
                case uri
            }
        }
        
        public struct Artists: Codable {
            public let externalUrls: ExternalUrls
            public let href: String
            public let id: String
            public let name: String
            public let type: String
            public let uri: String
            
            public struct ExternalUrls: Codable {
                public let spotify: String
            }
            
            private enum CodingKeys: String, CodingKey {
                case externalUrls = "external_urls"
                case href
                case id
                case name
                case type
                case uri
            }
        }
        
        public struct ExternalIds: Codable {
            public let isrc: String
        }
        
        public struct ExternalUrls: Codable {
            public let spotify: String
        }
        
        private enum CodingKeys: String, CodingKey {
            case album
            case artists
            case availableMarkets = "available_markets"
            case discNumber = "disc_number"
            case durationMs = "duration_ms"
            case explicit
            case externalIds = "external_ids"
            case externalUrls = "external_urls"
            case href
            case id
            case name
            case popularity
            case previewUrl = "preview_url"
            case trackNumber = "track_number"
            case type
            case uri
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case context
        case timestamp
        case progressMs = "progress_ms"
        case isPlaying = "is_playing"
        case currentlyPlayingType = "currently_playing_type"
        case actions
        case item
    }
}

class SpotifyTestViewController: UIViewController {

    @IBOutlet weak var result: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
  
        spotifyManager.authorize()
        self.result.text = "waiting for connection..."
        let url  = "https://api.spotify.com/v1/me/player/currently-playing"
        spotifyManager.refreshToken(completionHandler: { ans in
            print("refresh")
            let Auth_header: HTTPHeaders = [
                "Authorization" : "Bearer " + spotifyManager.getAccessToken()
            ]

            print("start request")
            print("will use:"+spotifyManager.getAccessToken())
            Alamofire.request(url, method: .get, parameters: nil, headers: Auth_header).responseString(completionHandler: {
                response in
                print("counter")
                print("res"+response.value!)
                self.result.text = "res"+response.value!
            })
            print("end request")
            print(ans)
        })
        

        // Do any additional setup after loading the view.
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
