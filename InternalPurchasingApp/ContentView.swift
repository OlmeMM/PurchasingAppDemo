//
//  ContentView.swift
<<<<<<< HEAD:InternalPurchasingApp/ContentView.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/5/24.
=======
//  test
//
//  Created by Olme Matias Molina on 3/25/24.
>>>>>>> dc77ab7af5297ac8c25ee105014ce973342d01e0:PurchasingApp/ContentView.swift
//

import SwiftUI
import Alamofire

<<<<<<< HEAD:InternalPurchasingApp/ContentView.swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
=======
struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
        } else {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) {
            data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct Course: Hashable, Codable {
    let name: String
    let image: String
}

class ViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else { return }
        
        AF.request(url).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                do {
                    let courses = try JSONDecoder().decode([Course].self, from: data)
                    DispatchQueue.main.async {
                        self?.courses = courses
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.courses, id: \.self) { course in
                HStack {
                    URLImage(urlString: course.image)
                    Text(course.name).bold()
                }
                .padding(3)
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetch()
            }
        }
>>>>>>> dc77ab7af5297ac8c25ee105014ce973342d01e0:PurchasingApp/ContentView.swift
    }
}

#Preview {
    ContentView()
}
<<<<<<< HEAD:InternalPurchasingApp/ContentView.swift
=======
    
>>>>>>> dc77ab7af5297ac8c25ee105014ce973342d01e0:PurchasingApp/ContentView.swift
