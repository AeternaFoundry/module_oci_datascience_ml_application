resource "oci_datascience_ml_application" "datascience_ml_applications" {
  for_each = var.datascience_ml_applications

  compartment_id = each.value.compartment_id
  name           = each.value.name
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  freeform_tags  = each.value.freeform_tags

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

