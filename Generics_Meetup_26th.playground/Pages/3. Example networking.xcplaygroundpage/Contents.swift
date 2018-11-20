import Foundation

struct ModelStruct: Codable {
    var property: String
}

enum APIError: Error {
    case decoding
    case noData
    case unknown(Error)
}

func getModel(from url: URL, completion: @escaping (ModelStruct?, APIError?) -> Void) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("\(error)")
            completion(nil, APIError.unknown(error))
            return
        }
        
        if let data = data {
            let jsonDecoder = JSONDecoder()
            
            if let obj = try? jsonDecoder.decode(ModelStruct.self, from: data) {
                print("Houston we got an object \(obj)")
                completion(obj, nil)
            } else {
                print("Error decoding")
                completion(nil, APIError.decoding)
            }
        } else {
            print("There's no data")
            completion(nil, APIError.noData)
        }
        
        }.resume()
}


getModel(from: URL(string: "http://google.com")!) { (model, error) in
    if let error = error {
        print("Oops I did it again 😅! \(error)")
        return
    }
    
    if let model = model {
        print("Hell yeah, object >>> \(model)")
    }
}

//----------------------------------------------------------------

// 😨

struct NewModelStruct: Codable {
    var property: String
}

//----------------------------------------------------------------
