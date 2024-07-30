resource "azurerm_application_gateway" "main" {
  name                = var.gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gatewayIPConfig"
    subnet_id = var.vnet_subnet_id
  }

  frontend_ip_configuration {
    name                 = "frontendIP"
    public_ip_address_id = azurerm_public_ip.main.id
  }

  frontend_port {
    name = "frontendPort"
    port = 80
  }

  backend_address_pool {
    name = "backendPool"
  }

  backend_http_settings {
    name                  = "backendHttpSettings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "httpListener"
    frontend_ip_configuration_name = "frontendIP"
    frontend_port_name             = "frontendPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "httpListener"
    backend_address_pool_name  = "backendPool"
    backend_http_settings_name = "backendHttpSettings"
  }

  waf_configuration {
    enabled        = var.waf_configuration.enabled
    firewall_mode  = var.waf_configuration.firewall_mode
    rule_set_type  = "OWASP"
    rule_set_version = "3.2" # Example version
  }
}

resource "azurerm_public_ip" "main" {
  name                = "${var.gateway_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
