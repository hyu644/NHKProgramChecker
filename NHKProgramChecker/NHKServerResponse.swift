//
//  NHKServerResponse.swift
//  NHKProgramChecker
//
//  Created by hyu on R 2/09/10.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import Foundation

struct NHKprogramResponse: Codable {
   
    let list: collectionOfProgram
    
    struct collectionOfProgram: Codable {
        
        let g1:[Program]
        
        struct Program: Codable {
            let id: String //番組ID
            let event_id: String      //番組イベントID
            let start_time: String    //放送開始日時（YYYY-MM-DDTHH:mm:ssZ形式）
            let end_time: String      //放送終了日時（YYYY-MM-DDTHH:mm:ssZ形式）
            let area: Area            //Areaオブジェクト
            let service: Service      //Serviceオブジェクト
            let title: String         //番組名
            let subtitle: String      //番組内容
            let genres: [String]      //番組ジャンル
            
            struct Area: Codable {
                let id: String    //地域ID
                let name: String    //地域名
            }
            
            struct Service: Codable {
                let id: String      //サービスID
                let name: String    //サービス名
                let logo_s: Logo    //サービスロゴ画像:小（Logoオブジェクト）
                let logo_m: Logo    //サービスロゴ画像:中（Logoオブジェクト）
                let logo_l: Logo    //サービスロゴ画像:大（Logoオブジェクト）
            }
            
                 struct Logo: Codable {
                     let url: String         //ロゴ画像のURL
                     let width: String       //ロゴ画像の幅
                     let height: String      //ロゴ画像の高さ
            }
        }
    }
}

