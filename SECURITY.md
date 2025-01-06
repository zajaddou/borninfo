# Security Policy

## Supported Versions

We release security updates for the following versions of **BornInfo**:

- Latest stable release: `v1.x.x`

Other older versions may no longer receive updates and are considered unsupported for security purposes.

## Reporting a Vulnerability

If you discover a security vulnerability in **BornInfo**, please report it as soon as possible. We take security issues seriously and will work with you to address them.

### Steps to report a vulnerability:

1. **Do not disclose the vulnerability publicly**.
2. Send an email to [zajaddou@student.1337.ma](mailto:zajaddou@student.1337.ma) or open a private issue on the repository.
3. Provide detailed information about the vulnerability, including:
   - Steps to reproduce.
   - Impact assessment.
   - Any potential mitigations or solutions (if applicable).
4. We will acknowledge receipt of your report and begin investigating it promptly.

## Security Best Practices

To enhance the security of your system when using **BornInfo**, consider the following best practices:

### 1. **Use Signed Releases**
   Always download and install **BornInfo** from trusted sources such as the official GitHub repository or signed package files.

### 2. **Regular Updates**
   Stay up to date with the latest versions of **BornInfo**. Security patches are often included in newer releases. You can check for updates by visiting the [releases page](https://github.com/zajaddou/borninfo/releases).

### 3. **Limit Privileges**
   When using **BornInfo**, avoid running the tool with elevated privileges (e.g., as `root` or with `sudo`) unless absolutely necessary. This limits the potential damage of any security issue.

### 4. **Secure Your System**
   Ensure your system is regularly patched with the latest security updates from your operating system vendor. Use firewall rules and proper access control to limit the attack surface.

### 5. **Audit Logs**
   If you're concerned about the execution of the tool on shared or critical systems, consider enabling audit logging to track any commands or actions performed.

### 6. **Use HTTPS for Git Operations**
   When cloning or pulling from the repository, always use HTTPS instead of HTTP to ensure encrypted communication.

## Secure Coding Practices

We follow security best practices during the development of **BornInfo**, including:

- Input sanitization to prevent injection attacks.
- Regular security audits and code reviews.
- Avoiding the use of sensitive information in commit messages and code.

## License

**BornInfo** is licensed under the [MIT License](LICENSE). Please review the license for full terms and conditions.

## Disclaimer

While we take all necessary precautions to ensure **BornInfo** is secure, no software is completely free of vulnerabilities. Always follow best practices for system security and use additional security tools as needed.

For any further questions or concerns, feel free to reach out to us at [zajaddou@student.1337.ma](mailto:zajaddou@student.1337.ma).
