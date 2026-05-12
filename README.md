# Apache Hadoop Full-Stack GUI Manager (Windows)

![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-blue)
![License](https://img.shields.io/badge/License-Apache%202.0-green)
![Hadoop](https://img.shields.io/badge/Hadoop-3.4.1-yellow)
![Java](https://img.shields.io/badge/Java-Amazon%20Corretto%208-orange)



An automated, enterprise-grade Graphical User Interface (GUI) and deployment engine designed to solve the Developer Experience (DX) challenges of setting up a pseudo-distributed Apache Hadoop cluster on Windows environments.

Developed by **Ashutosh Joshi** | NMIET Pune

---

## 📖 The Problem (Developer Experience)
Setting up Apache Hadoop on Windows traditionally requires heavy manual intervention: downloading tarballs, configuring system environment variables, manually editing XML configuration files, fetching native Windows binaries (`winutils.exe`), and bypassing strict execution policies. For students and junior developers, this often leads to days of troubleshooting "Connection Refused" and `JAVA_HOME` path resolution errors.

## 💡 The Solution
This tool abstracts the entire Hadoop infrastructure setup into a **1-Click executable**. It acts as an autonomous installer, service manager, and integrated IDE, effectively replacing 15-page installation PDFs with a single, highly optimized Windows binary.

<img width="1920" height="1013" alt="Screenshot (47)" src="https://github.com/user-attachments/assets/196be4f3-094f-45a3-8d74-4ea7d030fae6" />
<img width="1920" height="1007" alt="Screenshot (46)" src="https://github.com/user-attachments/assets/08ea3995-164f-4007-9c91-847cf0c95e5d" />
<img width="1920" height="1011" alt="Screenshot (45)" src="https://github.com/user-attachments/assets/31e3ea8b-5d13-41e1-b4a8-f7d698e706a4" />
<img width="1920" height="1009" alt="Screenshot (44)" src="https://github.com/user-attachments/assets/65d45ad6-b944-47a1-b081-c670b3bb46fb" />
<img width="1920" height="1007" alt="Screenshot (43)" src="https://github.com/user-attachments/assets/6387e901-bc5e-4970-b0ca-83fd8f293ace" />
<img width="1920" height="1005" alt="Screenshot (42)" src="https://github.com/user-attachments/assets/5fe6917d-f33b-4719-aa4e-4e333cdcc725" />

---

## 🏗️ Architecture & Tech Stack

This software operates as a hybrid engine:
1. **Core Automation:** PowerShell 5.1+ scripting for autonomous dependency resolution and binary execution.
2. **GUI Framework:** .NET WinForms wrapped natively inside the execution thread to avoid reliance on third-party frameworks.
3. **Compilation:** Built into a standalone `.exe` native Windows payload (using `ps2exe`), requiring absolutely no prerequisite installations on the host machine.

### Automated Workflow Pipeline:
1. **Dependency Validation:** Checks host for existing Java 8 and Hadoop installations.
2. **Auto-Fetch:** Downloads Amazon Corretto Java 8 and Hadoop 3.4.1 binaries dynamically via `Invoke-WebRequest`.
3. **Native Tar Extraction:** Utilizes Windows 10/11 native `tar` utility for silent extraction.
4. **Binary Injection:** Automatically fetches and patches `winutils.exe` and `hadoop.dll` for Windows execution compatibility.
5. **Dynamic XML Provisioning:** Programmatically generates `core-site.xml`, `hdfs-site.xml`, `mapred-site.xml`, and `yarn-site.xml` with absolute URI schema (`file:///`) mappings to prevent Windows path corruption.
6. **Initialization:** Formats the HDFS NameNode and initiates daemons cleanly.

---

## 🚀 Core Features

- **1-Click Auto-Installer:** Zero-touch deployment of Java 8 and Hadoop 3.4.1.
- **Enterprise Service Dashboard:** Real-time tracking of Java daemon processes (NameNode, DataNode, ResourceManager, NodeManager).
- **Cluster Lifecycle Management:** Start and Stop the YARN and DFS clusters with native process management.
- **Integrated Native CLI:** A dedicated, fully connected HDFS Command Line Interface spawned with pre-injected environment variables.
- **Dashboard Hub:** One-click access to NameNode, YARN, and DataNode Web UIs.
- **Built-In Command Dictionary:** A quick-reference cheat sheet for 30+ essential HDFS and YARN administrative commands.

---

## ⚙️ Quick Start Guide

### Prerequisites
- Windows 10 or Windows 11
- Active Internet Connection (for initial ~700MB payload download)

### Installation
1. Download the `Hadoop_FullStack_Manager.exe`.
2. Double-click the executable to launch the GUI.
3. Click **1. AUTO-INSTALL HADOOP**.
4. Wait 2-5 minutes as the engine downloads, extracts, and configures the environment in the background. Once complete, the Execution Log will state `INSTALLATION COMPLETED SUCCESSFULLY`.
5. Click **2. START CLUSTER** and wait for the Active Services status to change to `RUNNING (4/4)`.

### Using the Integrated Terminal
Simply click **LAUNCH NATIVE HADOOP TERMINAL**. The system will open a heavily customized, context-aware command prompt where you can instantly type commands like:
```bash
hdfs dfs -mkdir /myproject
hdfs dfs -ls /
```

---

## 🛠️ Troubleshooting & Cluster Reset

If your cluster experiences a corrupted NameNode (e.g., Status shows `PARTIAL` or you receive a `Connection refused on localhost:9000` error):
1. Click **3. STOP CLUSTER** and wait for all processes to terminate.
2. Open the Native Terminal and run the following to format the corrupted block pool:
```bash
rmdir /S /Q C:\hadoop\hadoop-3.4.1\data
hdfs namenode -format
```
3. Return to the GUI and click **START CLUSTER**.

---

## 🤝 Contributing
Contributions, issues, and feature requests are highly welcome! This tool aims to become the standard recommendation for Windows users looking to rapidly prototype Hadoop clusters. 

If you are an Apache Hadoop contributor, I would love feedback on how this tool can further align with the Hadoop ecosystem's standards.

---

## 📄 License
This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
