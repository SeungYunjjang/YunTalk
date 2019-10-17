//
//  ChatModel.swift
//  YunTalk
//
//  Created by exs-mobile yun on 23/08/2019.
//  Copyright © 2019 Seung Yun. All rights reserved.
//


import UIKit
import ObjectMapper

class ChatModel: Mappable {

    public var users: Dictionary<String, Bool> = [:] // 채팅방에 참여한 사람들
    public var comments: Dictionary<String, Comoment> = [:] // 채팅방의 대화내용
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        users <- map["users"]
        comments <- map["comments"]
    }
    
    public class Comoment: Mappable {
        public var uid: String?
        public var message: String?
        public var timeStamp: Int?
        
        public required init?(map: Map) {
            
        }
        
        public func mapping(map: Map) {
            uid <- map["uid"]
            message <- map["message"]
            timeStamp <- map["timestamp"]
        }
        
        
        
        
    }
    
}
