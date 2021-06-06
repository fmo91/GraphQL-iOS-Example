//
//  Apollo+GraphQL.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 06/06/2021.
//

import Foundation
import Combine
import Apollo

extension ApolloClient {
    enum FetchError: Error {
        case noFetchedData
    }

    func fetch<Q: GraphQLQuery>(
        query: Q,
        cachePolicy: CachePolicy = .returnCacheDataAndFetch
    ) -> AnyPublisher<Q.Data, Error> {
        let subject = PassthroughSubject<Q.Data, Error>()

        GraphQL.shared.client.fetch(
            query: query,
            cachePolicy: cachePolicy
        ) { result in
            switch result {
            case .failure(let error):
                subject.send(completion: .failure(error))
            case .success(let value):

                if let data = value.data {
                    subject.send(data)
                } else {
                    subject.send(completion: .failure(FetchError.noFetchedData))
                }
            }
        }

        return subject.eraseToAnyPublisher()
    }

    func mutate<M: GraphQLMutation>(
        mutation: M
    ) -> AnyPublisher<M.Data, Error> {
        let subject = PassthroughSubject<M.Data, Error>()

        GraphQL.shared.client.perform(mutation: mutation) { result in
            switch result {
            case .failure(let error):
                subject.send(completion: .failure(error))
            case .success(let value):

                if let data = value.data {
                    subject.send(data)
                } else {
                    subject.send(completion: .failure(FetchError.noFetchedData))
                }
            }
        }

        return subject.eraseToAnyPublisher()
    }
}
