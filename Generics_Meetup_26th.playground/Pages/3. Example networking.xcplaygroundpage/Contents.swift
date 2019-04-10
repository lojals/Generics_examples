import Foundation

struct User: Codable {
    var property: String
}

enum APIError: Error {
    case decoding
    case noData
    case unknown(Error)
}

func getUser(from url: URL, completion: @escaping (User?, APIError?) -> Void) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("\(error)")
            completion(nil, APIError.unknown(error))
            return
        }
        
        if let data = data {
            let jsonDecoder = JSONDecoder()
            
            if let obj = try? jsonDecoder.decode(User.self, from: data) {
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


getUser(from: URL(string: "http://google.com")!) { (model, error) in
    if let error = error {
        print("Oops I did it again 😅! \(error)")
        return
    }
    
    if let model = model {
        print("Hell yeah, object >>> \(model)")
    }
}

//----------------------------------------------------------------


enum Result<T, Error> {
    case success(T)
    case failure(Error)
}

func getModel<T: Decodable>(type: T.Type, from url: URL, completion: @escaping (Result<T, APIError>) -> Void) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("\(error)")
            completion(.failure(.unknown(error)))
            return
        }
        
        if let data = data {
            let jsonDecoder = JSONDecoder()
            
            if let obj = try? jsonDecoder.decode(T.self, from: data) {
                print("Houston we got an object \(obj)")
                completion(.success(obj))
            } else {
                print("Error decoding")
                completion(.failure(.decoding))
            }
        } else {
            print("There's no data")
            completion(.failure(.noData))
        }
        
        }.resume()
}

getModel(type: User.self, from: URL(string: "http://google.com")!) {
    result in
    switch result {
    case .success(let user):
        print("Hell yeah, object >>> \(user)")
    case .failure(let error):
        print("Oops I did it again 😅! \(error)")
    }
}
