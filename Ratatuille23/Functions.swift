//
//  Functions.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import Foundation
import SwiftUI

class serverAPI {

    static func addDB(employee: Employee){
        let url = URL(string: "http://localhost:3000/employee/")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let data = try! JSONEncoder().encode(employee)
        print(data)
        request.httpBody = data
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode = (response as! HTTPURLResponse).statusCode

            if statusCode == 200 {
                print("SUCCESS")
            } else {
                print("FAILURE"+String(statusCode))
            }
        }

        task.resume()
    }
    
    
    static func addRestaurantDB(ristorante: Ristorante){
        let url = URL(string: "http://localhost:3000/restaurant/")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let data = try! JSONEncoder().encode(ristorante)
        print(data)
        request.httpBody = data
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode = (response as! HTTPURLResponse).statusCode

            if statusCode == 200 {
                print("SUCCESS")
            } else {
                print("FAILURE"+String(statusCode))
            }
        }

        task.resume()
    }
    
    
    static func getUserPass(username: String, password: String) async throws -> [Employee] {
        let url = "http://localhost:3000/employee/\(username)/\(password)"
        let myUrl = URL(string: url)!
        var request = URLRequest(url: myUrl)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)
        print(data)

        let decoder = JSONDecoder()
        var fetchedData: [Employee]
        do {
            fetchedData = try decoder.decode([Employee].self, from: data)
        }
        catch{
            return []
        }

        return fetchedData
    }
    
    static func getMEnuItems(restaurant_id: Int) async throws -> [MenuItem] {
        let url = "http://localhost:3000/menu-tems//restaurant/"+String(restaurant_id)
        let myUrl = URL(string: url)!
        var request = URLRequest(url: myUrl)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)

        let decoder = JSONDecoder()
        var fetchedData: [MenuItem]
        do {
            print("Ciao1 id: " + String(restaurant_id))
            fetchedData = try decoder.decode([MenuItem].self, from: data)
            print("Ciao2")
        }
        catch{
            print("Ciao3")
            return []
        }
        print("fetched items " + fetchedData[0].nome!)
        return fetchedData
    }
    
    
    static func getRisto(username: String, password: String) async throws -> [Ristorante] {
        let url = "http://localhost:3000/restaurant/"+username+"-"+password
        let myUrl = URL(string: url)!
        var request = URLRequest(url: myUrl)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)
        print(data)

        let decoder = JSONDecoder()
        var fetchedData: [Ristorante]
        do {
            fetchedData = try decoder.decode([Ristorante].self, from: data)
        }
        catch{
            return []
        }

        return fetchedData
    }

    
    
    /*static func getActors (id: String) async throws -> [Actor]{
        let url: String = "https://api.themoviedb.org/3/movie/" + id + "/credits?api_key=255a9707c648a5a21175e27b2ed0eb9d&language=en-US"

        let myUrl: URL = URL(string: url)!

        var request: URLRequest = URLRequest(url: myUrl)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)

        let decoder = JSONDecoder()
    
        
        let fetchedData = try! decoder.decode(Risultato.self, from: data)
        
        return fetchedData.cast
    }
    
    static func getCrew (id: String) async throws -> [Actor]{
        let url: String = "https://api.themoviedb.org/3/movie/" + id + "/credits?api_key=255a9707c648a5a21175e27b2ed0eb9d&language=en-US"

        let myUrl: URL = URL(string: url)!

        var request: URLRequest = URLRequest(url: myUrl)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)

        let decoder = JSONDecoder()
    
        
        let fetchedData = try! decoder.decode(Risultato.self, from: data)
        
        return fetchedData.crew
    }
    
    static func getReviews (id: String) async throws -> [Risult]{
        let url: String = "https://api.themoviedb.org/3/movie/" + id + "/reviews?api_key=255a9707c648a5a21175e27b2ed0eb9d&language=en-US&page=1"

        let myUrl: URL = URL(string: url)!

        var request: URLRequest = URLRequest(url: myUrl)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)

        let decoder = JSONDecoder()
    
        
        let fetchedData = try! decoder.decode(Risulti.self, from: data)
        
        return fetchedData.results!
    }
    
    static func getGenres () async throws -> [Genre]{
        let url: String = "https://api.themoviedb.org/3/genre/movie/list?api_key=255a9707c648a5a21175e27b2ed0eb9d&language=en-US"

        let myUrl: URL = URL(string: url)!

        var request: URLRequest = URLRequest(url: myUrl)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)

        let decoder = JSONDecoder()
    
        
        let fetchedData = try! decoder.decode(ResultsGeneri.self, from: data)
        
        return fetchedData.genres!
    }
    */
    
}
