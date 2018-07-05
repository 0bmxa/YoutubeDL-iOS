//
//  PlaylistTests.swift
//  YoutubeDL
//
//  Created by Pieter de Bie on 02/10/2016.
//  Copyright © 2016 Pieter de Bie. All rights reserved.
//

import XCTest
import Foundation

class PlaylistTests: XCTestCase {
    func testInit() {
        let playlist = Playlist(url: URL(string: "http://youtube.com")!)

        XCTAssertEqual(playlist.url.absoluteString, "http://youtube.com")
        XCTAssertEqual(playlist.videos, [])
    }
    
    func testSerialization() {
        let originalPlaylist = Playlist(url: URL(string: "http://test.com")!)
        originalPlaylist.state = .Loading
        originalPlaylist.title = "some title"
        originalPlaylist.id = "main id"
        
        let serialized = NSKeyedArchiver.archivedData(withRootObject: originalPlaylist)
        let deserializedPlayist = NSKeyedUnarchiver.unarchiveObject(with: serialized)! as! Playlist
        
        XCTAssertEqual(originalPlaylist.url, deserializedPlayist.url)
        XCTAssertEqual(originalPlaylist.id, deserializedPlayist.id)
        XCTAssertEqual(originalPlaylist.title, deserializedPlayist.title)
    }
}
