import Fluent

struct CreateStatus: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Schema.status)
            .id()
            .field(.title, .string)
            .field(.color, .string)
            .field(.statusEquivalent, .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Schema.status).delete()
    }
}
