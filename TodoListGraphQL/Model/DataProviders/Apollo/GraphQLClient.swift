//
//  GraphQLClient.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import Foundation
import Apollo
import ApolloSQLite

final class GraphQL {
    let client: ApolloClient

    static let shared = GraphQL()

    init() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true).first!
        let documentsURL = URL(fileURLWithPath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent("todo_apollo_db.sqlite")

        let sqliteCache = try! SQLiteNormalizedCache(fileURL: sqliteFileURL)
        let store1 = ApolloStore(cache: sqliteCache)
        let configuration = URLSessionConfiguration.default

        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)

        let url = URL(string: "http://localhost:4000/")!

        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)

        client = ApolloClient(networkTransport: requestChainTransport,
                              store: store1)
        client.cacheKeyForObject = { $0["id"] }
    }
}

class NetworkInterceptorProvider: LegacyInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}

class CustomInterceptor: ApolloInterceptor {

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {

        print("request :\(request)")
        print("response :\(String(describing: response))")

        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
