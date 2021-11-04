//
//  Request.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 03/11/21.
//

import Foundation
import Alamofire

class Request  {
    
    
    
    // MARK: - Methods
    public func get(_ url : String ) {
        AF.request(url).response { response in
            if(response.response?.statusCode == 200){
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    
                } catch let error {
                    print(error)
                }
            }
            else {
                
            }
        }
    }
    
    public func post(url : String , myParameters : Parameters = [:], returnRequest : @escaping ( (String) -> Void )  ){
        
        AF.request(url, method: .post , parameters: myParameters)
            
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let stringResposta = response.data else{
                        return print("invalid response")
                    }
                    
                    returnRequest(stringResposta.base64EncodedString())
                    
                case let .failure(error):
                    print(error)
                }
            }
    }
    
}
