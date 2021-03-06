resource "digitalocean_firewall" "webserver" {
    name = "my-blog-firewall"
    droplet_ids = ["${digitalocean_droplet.my-blog-web.id}"]

    inbound_rule = [
        {
            protocol = "tcp"
            port_range = "22"
        },
        {
            protocol = "tcp"
            port_range = "80",
        },
        {
            protocol = "tcp"
            port_range = "443",
        }
    ]

    outbound_rule = [
        {
            protocol = "tcp"
            port_range = "53"
        },
        {
            protocol = "udp"
            port_range = "53"
        }
    ]
}