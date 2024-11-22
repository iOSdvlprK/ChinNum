//
//  ProverbViewModel.swift
//  ChinNum
//
//  Created by joe on 11/22/24.
//

import Foundation
import Observation

@Observable
class ProverbViewModel {
    var proverbModel: ProverbModel = ProverbModel.defaultQuote()
    
    let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"
    
    func getRandomQuote() {
        getQuote(urlString: urlString)
    }
    
    private func getQuote(urlString: String) {
        // create URL
        guard let url = URL(string: urlString) else { return }
        
        // send a GET request from the quote API
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // try to get data and any error information
        let task = URLSession.shared.dataTask(with: request) { data, resp, error in
            let jsonDecoder = JSONDecoder()
            
            // this is called if error is not nil (there is an error)
            if let error {
                print(error)
                return
            }
            
            // get data if it is not nil
            guard let data = data else {
                print("data was nil")
                return
            }
            
            do {
                let newProverbModel = try jsonDecoder.decode(ProverbModel.self, from: data)
                
                print(newProverbModel.proverb)
                print(newProverbModel.pinyin)
                print(newProverbModel.translation)
                
                // crucial step - update quoteModel
                DispatchQueue.main.async {
                    self.proverbModel = newProverbModel
                }
            } catch {
                print(data.description)
                print(error)
            }
        }
        
        task.resume()
    }
}

