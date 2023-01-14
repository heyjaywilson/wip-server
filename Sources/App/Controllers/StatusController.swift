import Fluent
import Vapor

struct StatusController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let status = routes.grouped("todoStatus")
        status.get(use: index)
        status.post(use: create)
        status.group(":statusID") { status in
            status.delete(use: delete)
        }
    }

    func index(req: Request) async throws -> [Status] {
        try await Status.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Status {
        let status = try req.content.decode(Status.self)
        try await status.save(on: req.db)
        return status
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let status = try await Status.find(req.parameters.get("statusID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await status.delete(on: req.db)
        return .noContent
    }
}
