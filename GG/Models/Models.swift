//
//  Models.swift
//  GG
//
//  Created by Yannick Lawler on 14.03.21.
//

import Foundation
import UIKit

enum GGType: String {
    case customLobbyQuads = "Custom Lobby Quads"
    case customLobbyTrios = "Custom Lobby Trios"
    case customLobbyDuos = "Custom Lobby Duos"
    case customLobbySolos = "Custom Lobby Solos"
    case killRace_2v2 = "2 v 2 Kill Race Quads"
    case killRace_1v1 = "1 v 1 Kill Race Duos"
}

struct GGPlayer {
    let id: String
    let name: String
    let kd: Double
    let totalWins: Int
    let totalLoses: Int
}

class GGSquad: Equatable {
    
    
    let name: String
    let id: String
    let players: [GGPlayer]
    
    init(id: String, name: String, players: [GGPlayer]) {
        self.id = id
        self.name = name
        self.players = players
    }
    
    static func == (lhs: GGSquad, rhs: GGSquad) -> Bool {
        return lhs.id == rhs.id
    }
}


class Tournament {
    let name: String
    let date: Date
    let id: String
    
    
    // Variables for the amount of players
    var numPlayers: Int
    var maxPlayers: Int
    var minPlayers: Int
    var numSquads: Int
    
    var squads: [GGSquad] = []
    
    var tournamentType: GGType
    
    var image: UIImage = UIImage(named: "Warzone-Rebirth-Island")!
    
    var prize: Int = 0
    
    init(id: String, name: String, date: Date, numPlayers: Int = 0, maxPlayers: Int = 150, minPlayers: Int = 24, squads: [GGSquad] = [], tournamentType: GGType, prize: Int = 0) {
        self.id = id
        self.name = name
        self.date = date
        self.numPlayers = numPlayers
        self.maxPlayers = maxPlayers
        self.minPlayers = minPlayers
        self.squads = squads
        self.tournamentType = tournamentType
        self.numSquads = 0
        self.determineTournament()
        self.prize = prize
    }
    
    private func determineTournament() {
        switch self.tournamentType {
        case GGType.customLobbyQuads:
            self.numSquads = self.maxPlayers / 4
        case GGType.customLobbyTrios:
            self.numSquads = self.maxPlayers / 3
        case GGType.customLobbyDuos:
            self.numSquads = self.maxPlayers / 2
        case GGType.customLobbySolos:
            self.numSquads = self.maxPlayers
        case GGType.killRace_2v2:
            self.numSquads = self.maxPlayers / 4
        case GGType.killRace_1v1:
            self.numSquads = self.maxPlayers / 2
        }
    }
    
    func getTournamentType() -> String {
        return self.tournamentType.rawValue
    }
    
    func getPrize() -> String {
        return "$\(self.prize)"
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        
        return dateFormatter.string(from: self.date)
    }
    
    private func addSquad(squad: GGSquad, completion: (Bool) -> Void) {
        if !self.squads.contains(squad) {
            self.squads.append(squad)
            completion(true)
        } else {
            completion(false)
        }
    }
}

class UpcomingTournament: Tournament {
    
    
    
    
    
}


class FutureTournament: Tournament {
    
    
    
}

























struct chatDescription: Equatable {
    let id: String
    let user: GGUser
}

struct chatDetail: Equatable {
    static func == (lhs: chatDetail, rhs: chatDetail) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: String
    let texts: [chatMessage]
}

struct chatMessage {
    let text: String
    let sender: GGUser
    let receiver: GGUser
}


class GGUser: Equatable {
    
    
    var name: String
    let id: String
    var profileImage: UIImage
    
    var chatDescriptions: [chatDescription] = []
    var chatDetails: [chatDetail] = []
    
    init(name: String, id: String = UUID().uuidString, image: UIImage = UIImage(systemName: "person") ?? UIImage()) {
        self.name = name
        self.id = id
        self.profileImage = image
    }
    
    func addNewChat(for user: GGUser) {
        
        let id = UUID().uuidString
        
        let detail = chatDetail(id: id, texts: [])
        let description = chatDescription(id: id, user: user)
        
        addNewChatDetail(detail)
        addNewChatDescription(description)
    }
    
    func addNewChatDetail(_ chatDetail: chatDetail) {
        if !self.chatDetails.contains(chatDetail) {
            self.chatDetails.insert(chatDetail, at: 0)
        }
    }
    
    func addNewChatDescription(_ chatDescription: chatDescription) {
        if !self.chatDescriptions.contains(chatDescription) {
            self.chatDescriptions.insert(chatDescription, at: 0)
        }
    }
    
    func getChatDescriptionFor(int: Int) -> chatDescription? {
        if int < self.chatDescriptions.count {
            return self.chatDescriptions[int]
        } else {
            return nil
        }
    }
    
    func getNumberOfChats() -> Int {
        return chatDescriptions.count
    }
    
    static func == (lhs: GGUser, rhs: GGUser) -> Bool {
        return lhs.id == rhs.id
    }
    
}



