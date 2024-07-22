class CreateEmWindows81TrustedRootCertificate {
  [string]${@odata.type}
    [string]$description
    [string]$displayName
    [object]$version
    [string]$trustedRootCertificate
    [string]$certFileName
    [string]$destinationStore

  # Default constructor
  CreateEmWindows81TrustedRootCertificate() {
      $this."@odata.type" = ''
        $this.description = ''
        $this.displayName = ''
        $this.version = $null
        $this.trustedRootCertificate = ''
        $this.certFileName = ''
        $this.destinationStore = ''
  }

  # Parameterized constructor
  CreateEmWindows81TrustedRootCertificate ($policy) {
      $this."@odata.type" = $policy."@odata.type"
        $this.description = $policy.description
        $this.displayName = $policy.displayName
        $this.version = $policy.version
        $this.trustedRootCertificate = $policy.trustedRootCertificate
        $this.certFileName = $policy.certFileName
        $this.destinationStore = $policy.destinationStore
  }

  # Overriding the ToString method
  [string] ToString() {
      return "Class: CreateEmWindows81TrustedRootCertificate"
  }
}
