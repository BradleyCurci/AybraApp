//
//  Network.swift
//  SkiClub_0.1
//
//  Created by Bradley J Curci on 12/21/22.
//

import SwiftUI

class Network: ObservableObject {
    
    @AppStorage("emailAddress") var emailAddress: String = ""
    @Published var items = [Items]()

    func loadData() {
        //MARK: making url request
        let email = (emailAddress)
        
        var request = URLRequest(url: URL(string: "https://api.tadabase.io/api/v1/data-tables/q3kjZVj6Vb/records?filters[items][0][field_id]=field_63&filters[items][0][operator]=is&filters[items][0][val]=" + email)!,timeoutInterval: Double.infinity)
        
        request.addValue("oOjDapMrB9", forHTTPHeaderField: "X-Tadabase-App-id")
        request.addValue("zO3mBa8Bbvxx", forHTTPHeaderField: "X-Tadabase-App-Key")
        request.addValue("CqWsslGkqAFrNOmw2BsUd7JeJGVu35QG", forHTTPHeaderField: "X-Tadabase-App-Secret")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            //MARK: getting response
            guard let response = response as? HTTPURLResponse else { return }
            
            //MARK: checking good response, and decoding
            if response.statusCode == 200 {
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    
                    do {
                        let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                        self.items = decodedResponse.items
                    } catch let error {
                        print("Error Decoding: ", error)
                    }

                    print(String(data: data, encoding: .utf8)!)
                }
            }
        }
        task.resume()
    }
}
