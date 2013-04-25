swftp Cookbook
==============

Install and configure [swftp](https://github.com/softlayer/swftp) the chef way.

Requirements
------------

No addional recipe requirements are needed

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### swftp::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['swftp']['ftp']['enabled']</tt></td>
    <td>Boolean</td>
    <td>whether to run the FTP</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['ftp']['port']</tt></td>
    <td>Integer</td>
    <td>Port for FTP to listen on</td>
    <td><tt>5021</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['sftp']['enabled']</tt></td>
    <td>Boolean</td>
    <td>whether to run the sFTP</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['sftp']['port']</tt></td>
    <td>Integer</td>
    <td>Port for sFTP to listen on</td>
    <td><tt>5022</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['auth_url']</tt></td>
    <td>String</td>
    <td>Swift auth url</td>
    <td><tt>http://127.0.0.1:8080/auth/v1.0</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['session_connections']</tt></td>
    <td>Integer</td>
    <td>Maximum number of connections a session can consume</td>
    <td><tt>10</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['max_connections']</tt></td>
    <td>Integer</td>
    <td>Number of swift persistent backend connections to pool request across</td>
    <td><tt>20</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['connection_timeout']</tt></td>
    <td>Integer</td>
    <td>timeout for the persistent connections</td>
    <td><tt>240</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['statsd']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Enable statsd support</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['statsd']['host']</tt></td>
    <td>String</td>
    <td>Host to pumble with stats</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['swftp']['statsd']['port']</tt></td>
    <td>Integer</td>
    <td>Port to pumble with stats</td>
    <td><tt>8125</tt></td>
  </tr>
</table>

Usage
-----
#### swftp::default
Just include `swftp` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[swftp]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Kevin Landreth
License: MIT
