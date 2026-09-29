import IPv4_Standard
import RFC_791
import Testing

@Suite
struct `IPv4 Standard` {

    @Test
    func `IPv4 names the RFC 791 address family`() throws {
        let address = try IPv4.Address("192.168.1.1")
        #expect(address.rawValue == 0xC0A8_0101)
        #expect(address.description == "192.168.1.1")
    }
}
