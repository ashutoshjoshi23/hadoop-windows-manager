<# :
@echo off
TITLE Apache Hadoop Enterprise Setup
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression (Get-Content -LiteralPath '%~f0' | Select-Object -Skip 5 | Out-String)"
exit /b
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object System.Windows.Forms.Form
$form.Text = "Apache Hadoop Full-Stack Manager"
$form.Size = New-Object System.Drawing.Size(870, 780)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#F2F2F2")
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

# SAP Blue Header
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Size = New-Object System.Drawing.Size(870, 70)
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#003366")
$form.Controls.Add($headerPanel)

$title = New-Object System.Windows.Forms.Label
$title.Text = "HADOOP FULL-STACK MANAGER"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::White
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(20, 15)
$headerPanel.Controls.Add($title)

$subtitle = New-Object System.Windows.Forms.Label
$subtitle.Text = "Engineered by Ashutosh Joshi | NMIET Pune"
$subtitle.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Regular)
$subtitle.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#D0D0D0")
$subtitle.AutoSize = $true
$subtitle.Location = New-Object System.Drawing.Point(520, 25)
$headerPanel.Controls.Add($subtitle)

# Status Panel (Left)
$panelStatus = New-Object System.Windows.Forms.GroupBox
$panelStatus.Text = "System Status Overview"
$panelStatus.Size = New-Object System.Drawing.Size(380, 150)
$panelStatus.Location = New-Object System.Drawing.Point(20, 90)
$panelStatus.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$panelStatus.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#333333")
$form.Controls.Add($panelStatus)

$lblJava = New-Object System.Windows.Forms.Label
$lblJava.Text = "Java Runtime : Checking..."
$lblJava.Location = New-Object System.Drawing.Point(20, 35)
$lblJava.AutoSize = $true
$lblJava.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Regular)
$panelStatus.Controls.Add($lblJava)

$lblHadoop = New-Object System.Windows.Forms.Label
$lblHadoop.Text = "Hadoop Core : Checking..."
$lblHadoop.Location = New-Object System.Drawing.Point(20, 70)
$lblHadoop.AutoSize = $true
$lblHadoop.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Regular)
$panelStatus.Controls.Add($lblHadoop)

$lblProc = New-Object System.Windows.Forms.Label
$lblProc.Text = "Active Services : Checking..."
$lblProc.Location = New-Object System.Drawing.Point(20, 105)
$lblProc.AutoSize = $true
$lblProc.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Regular)
$panelStatus.Controls.Add($lblProc)

$btnCheck = New-Object System.Windows.Forms.Button
$btnCheck.Text = "REFRESH SYSTEM STATUS"
$btnCheck.Size = New-Object System.Drawing.Size(380, 40)
$btnCheck.Location = New-Object System.Drawing.Point(20, 255)
$btnCheck.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#E0E0E0")
$btnCheck.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#333333")
$btnCheck.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnCheck.Cursor = [System.Windows.Forms.Cursors]::Hand
$form.Controls.Add($btnCheck)

# Action Panel (Right)
$panelAction = New-Object System.Windows.Forms.GroupBox
$panelAction.Text = "Operations Console"
$panelAction.Size = New-Object System.Drawing.Size(420, 240)
$panelAction.Location = New-Object System.Drawing.Point(420, 90)
$panelAction.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$panelAction.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#333333")
$form.Controls.Add($panelAction)

$btnInstall = New-Object System.Windows.Forms.Button
$btnInstall.Text = "1. AUTO-INSTALL HADOOP"
$btnInstall.Size = New-Object System.Drawing.Size(380, 35)
$btnInstall.Location = New-Object System.Drawing.Point(20, 30)
$btnInstall.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#005A9C")
$btnInstall.ForeColor = [System.Drawing.Color]::White
$btnInstall.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnInstall.Cursor = [System.Windows.Forms.Cursors]::Hand
$panelAction.Controls.Add($btnInstall)

$btnStart = New-Object System.Windows.Forms.Button
$btnStart.Text = "2. START CLUSTER"
$btnStart.Size = New-Object System.Drawing.Size(380, 35)
$btnStart.Location = New-Object System.Drawing.Point(20, 70)
$btnStart.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#2E7D32")
$btnStart.ForeColor = [System.Drawing.Color]::White
$btnStart.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnStart.Cursor = [System.Windows.Forms.Cursors]::Hand
$panelAction.Controls.Add($btnStart)

$btnStop = New-Object System.Windows.Forms.Button
$btnStop.Text = "3. STOP CLUSTER"
$btnStop.Size = New-Object System.Drawing.Size(380, 35)
$btnStop.Location = New-Object System.Drawing.Point(20, 110)
$btnStop.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#C62828")
$btnStop.ForeColor = [System.Drawing.Color]::White
$btnStop.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnStop.Cursor = [System.Windows.Forms.Cursors]::Hand
$panelAction.Controls.Add($btnStop)

$btnUI = New-Object System.Windows.Forms.Button
$btnUI.Text = "4. OPEN DASHBOARDS"
$btnUI.Size = New-Object System.Drawing.Size(380, 35)
$btnUI.Location = New-Object System.Drawing.Point(20, 150)
$btnUI.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#424242")
$btnUI.ForeColor = [System.Drawing.Color]::White
$btnUI.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnUI.Cursor = [System.Windows.Forms.Cursors]::Hand
$panelAction.Controls.Add($btnUI)

$btnHelp = New-Object System.Windows.Forms.Button
$btnHelp.Text = "5. OPEN HADOOP CHEAT SHEET"
$btnHelp.Size = New-Object System.Drawing.Size(380, 35)
$btnHelp.Location = New-Object System.Drawing.Point(20, 190)
$btnHelp.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#F57C00")
$btnHelp.ForeColor = [System.Drawing.Color]::White
$btnHelp.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnHelp.Cursor = [System.Windows.Forms.Cursors]::Hand
$panelAction.Controls.Add($btnHelp)

# Execution Log (Bottom Left)
$logLabel = New-Object System.Windows.Forms.Label
$logLabel.Text = "System Execution Log"
$logLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$logLabel.Location = New-Object System.Drawing.Point(20, 310)
$logLabel.AutoSize = $true
$form.Controls.Add($logLabel)

$txtLog = New-Object System.Windows.Forms.TextBox
$txtLog.Multiline = $true
$txtLog.Size = New-Object System.Drawing.Size(380, 390)
$txtLog.Location = New-Object System.Drawing.Point(20, 335)
$txtLog.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#FAFAFA")
$txtLog.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#111111")
$txtLog.ReadOnly = $true
$txtLog.ScrollBars = "Vertical"
$txtLog.Font = New-Object System.Drawing.Font("Consolas", 10)
$form.Controls.Add($txtLog)

function LogMessage($msg) {
    $time = (Get-Date).ToString("HH:mm:ss")
    $txtLog.AppendText("[$time] $msg`r`n")
    $txtLog.SelectionStart = $txtLog.Text.Length
    $txtLog.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

# CLI Terminal (Bottom Right)
$panelCli = New-Object System.Windows.Forms.GroupBox
$panelCli.Text = "Native Command Terminal"
$panelCli.Size = New-Object System.Drawing.Size(420, 350)
$panelCli.Location = New-Object System.Drawing.Point(420, 375)
$panelCli.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$panelCli.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#333333")
$form.Controls.Add($panelCli)

$lblTermInfo = New-Object System.Windows.Forms.Label
$lblTermInfo.Text = "Launch the REAL interactive Command Line Interface.`r`n`r`nThis guarantees 100% compatibility with all HDFS and YARN commands, perfectly connected to your running cluster."
$lblTermInfo.Size = New-Object System.Drawing.Size(380, 100)
$lblTermInfo.Location = New-Object System.Drawing.Point(20, 60)
$lblTermInfo.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Regular)
$panelCli.Controls.Add($lblTermInfo)

$btnOpenTerm = New-Object System.Windows.Forms.Button
$btnOpenTerm.Text = "LAUNCH NATIVE HADOOP TERMINAL"
$btnOpenTerm.Size = New-Object System.Drawing.Size(380, 60)
$btnOpenTerm.Location = New-Object System.Drawing.Point(20, 200)
$btnOpenTerm.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#000000")
$btnOpenTerm.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00FF00")
$btnOpenTerm.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnOpenTerm.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$btnOpenTerm.Cursor = [System.Windows.Forms.Cursors]::Hand
$panelCli.Controls.Add($btnOpenTerm)

# Core Logic
$global:javaInstalled = $false
$global:hadoopInstalled = $false

function UpdateStatus {
    $javaCustom = "C:\hadoop_java8"
    $javaSys = "C:\PROGRA~1\Java\jre1.8.0_491"
    
    if (Test-Path $javaCustom) {
        $env:JAVA_HOME = $javaCustom
        $global:javaInstalled = $true
    } elseif (Test-Path $javaSys) {
        $env:JAVA_HOME = $javaSys
        $global:javaInstalled = $true
    } else {
        $global:javaInstalled = $false
    }

    if ($global:javaInstalled) {
        $lblJava.Text = "Java Runtime : INSTALLED"
        $lblJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#2E7D32")
    } else {
        $lblJava.Text = "Java Runtime : MISSING"
        $lblJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#C62828")
    }

    $hadoopSys = "C:\hadoop\hadoop-3.4.1"
    if (Test-Path $hadoopSys) {
        $env:HADOOP_HOME = $hadoopSys
        $global:hadoopInstalled = $true
        $lblHadoop.Text = "Hadoop Core : READY"
        $lblHadoop.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#2E7D32")
    } else {
        $global:hadoopInstalled = $false
        $lblHadoop.Text = "Hadoop Core : MISSING"
        $lblHadoop.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#C62828")
    }

    $javaProcs = (Get-Process -Name "java" -ErrorAction SilentlyContinue | Measure-Object).Count
    if ($javaProcs -ge 4) {
        $lblProc.Text = "Active Services : RUNNING ($javaProcs/4)"
        $lblProc.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#2E7D32")
    } elseif ($javaProcs -gt 0) {
        $lblProc.Text = "Active Services : PARTIAL ($javaProcs/4)"
        $lblProc.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#F57F17")
    } else {
        $lblProc.Text = "Active Services : STOPPED (0/4)"
        $lblProc.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#C62828")
    }
    
    if ($global:hadoopInstalled -and $global:javaInstalled) {
        $env:Path = "$env:Path;$env:HADOOP_HOME\bin;$env:HADOOP_HOME\sbin"
    }
}

$btnCheck.Add_Click({ UpdateStatus; LogMessage "System metrics refreshed." })

$btnInstall.Add_Click({
    UpdateStatus
    if ($global:javaInstalled -and $global:hadoopInstalled) {
        LogMessage "System is already fully installed and configured."
        return
    }
    $btnInstall.Enabled = $false
    LogMessage "--- STARTING AUTOMATED INSTALLATION ---"
    
    if (-not $global:javaInstalled) {
        LogMessage "Downloading Amazon Corretto Java 8..."
        Invoke-WebRequest -Uri "https://corretto.aws/downloads/latest/amazon-corretto-8-x64-windows-jdk.zip" -OutFile "$env:TEMP\java8.zip" -UseBasicParsing
        LogMessage "Extracting Java 8..."
        Expand-Archive -Path "$env:TEMP\java8.zip" -DestinationPath "$env:TEMP\java8_ext" -Force
        $jdkDir = Get-ChildItem "$env:TEMP\java8_ext" | Select-Object -First 1
        Move-Item -Path $jdkDir.FullName -Destination "C:\hadoop_java8" -Force
        $env:JAVA_HOME = "C:\hadoop_java8"
    }

    if (-not $global:hadoopInstalled) {
        LogMessage "Downloading Hadoop 3.4.1 (This may take a few minutes)..."
        New-Item -ItemType Directory -Path "C:\hadoop" -Force | Out-Null
        Invoke-WebRequest -Uri "https://dlcdn.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz" -OutFile "$env:TEMP\hadoop.tar.gz" -UseBasicParsing
        LogMessage "Extracting Hadoop components..."
        Start-Process -FilePath "tar" -ArgumentList "-xzf $env:TEMP\hadoop.tar.gz -C C:\hadoop" -Wait -WindowStyle Hidden
        
        LogMessage "Fetching Winutils binaries..."
        $binDir = "C:\hadoop\hadoop-3.4.1\bin"
        Invoke-WebRequest -Uri "https://github.com/cdarlint/winutils/raw/master/hadoop-3.3.5/bin/winutils.exe" -OutFile "$binDir\winutils.exe" -UseBasicParsing
        Invoke-WebRequest -Uri "https://github.com/cdarlint/winutils/raw/master/hadoop-3.3.5/bin/hadoop.dll" -OutFile "$binDir\hadoop.dll" -UseBasicParsing
        
        LogMessage "Configuring System XML files..."
        $hHome = "C:\hadoop\hadoop-3.4.1"
        New-Item -ItemType Directory -Path "$hHome\data\namenode" -Force | Out-Null
        New-Item -ItemType Directory -Path "$hHome\data\datanode" -Force | Out-Null
        New-Item -ItemType Directory -Path "$hHome\data\tmp" -Force | Out-Null
        New-Item -ItemType Directory -Path "C:\hadoop\tmp" -Force | Out-Null

        $coreSite = "<?xml version=`"1.0`" encoding=`"UTF-8`"?><configuration><property><name>fs.defaultFS</name><value>hdfs://localhost:9000</value></property><property><name>hadoop.tmp.dir</name><value>/hadoop/tmp</value></property></configuration>"
        Set-Content -Path "$hHome\etc\hadoop\core-site.xml" -Value $coreSite
        
        $hdfsSite = "<?xml version=`"1.0`" encoding=`"UTF-8`"?><configuration><property><name>dfs.replication</name><value>1</value></property><property><name>dfs.namenode.name.dir</name><value>file:///C:/hadoop/hadoop-3.4.1/data/namenode</value></property><property><name>dfs.datanode.data.dir</name><value>file:///C:/hadoop/hadoop-3.4.1/data/datanode</value></property><property><name>dfs.permissions.enabled</name><value>false</value></property></configuration>"
        Set-Content -Path "$hHome\etc\hadoop\hdfs-site.xml" -Value $hdfsSite

        $mapredSite = "<?xml version=`"1.0`" encoding=`"UTF-8`"?><configuration><property><name>mapreduce.framework.name</name><value>yarn</value></property><property><name>mapreduce.application.classpath</name><value>%HADOOP_HOME%/share/hadoop/mapreduce/*,%HADOOP_HOME%/share/hadoop/mapreduce/lib/*</value></property></configuration>"
        Set-Content -Path "$hHome\etc\hadoop\mapred-site.xml" -Value $mapredSite

        $yarnSite = "<?xml version=`"1.0`" encoding=`"UTF-8`"?><configuration><property><name>yarn.nodemanager.aux-services</name><value>mapreduce_shuffle</value></property><property><name>yarn.resourcemanager.hostname</name><value>localhost</value></property></configuration>"
        Set-Content -Path "$hHome\etc\hadoop\yarn-site.xml" -Value $yarnSite

        $envCmd = Get-Content "$hHome\etc\hadoop\hadoop-env.cmd"
        $envCmd = $envCmd -replace 'set JAVA_HOME=.*', "set JAVA_HOME=$env:JAVA_HOME"
        Set-Content -Path "$hHome\etc\hadoop\hadoop-env.cmd" -Value $envCmd
        
        LogMessage "Formatting Hadoop NameNode..."
        $env:HADOOP_HOME = $hHome
        $env:Path = "$env:Path;$hHome\bin"
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c echo Y | hdfs namenode -format" -Wait -WindowStyle Hidden
    }
    LogMessage "--- INSTALLATION COMPLETED SUCCESSFULLY ---"
    $btnInstall.Enabled = $true
    UpdateStatus
})

$btnStart.Add_Click({
    if (-not $global:hadoopInstalled) { LogMessage "ERROR: Please install Hadoop first."; return }
    LogMessage "Executing Start Sequence..."
    Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start-dfs.cmd"
    Start-Sleep -Seconds 3
    Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c start-yarn.cmd"
    LogMessage "Services initiated. Background workers are starting."
})

$btnStop.Add_Click({
    if (-not $global:hadoopInstalled) { return }
    LogMessage "Executing Stop Sequence..."
    Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c stop-yarn.cmd"
    Start-Sleep -Seconds 3
    Start-Process -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c stop-dfs.cmd"
    LogMessage "Stop sequence transmitted."
})

$btnUI.Add_Click({
    LogMessage "Connecting to Web Dashboards..."
    Start-Process "http://localhost:9870/dfshealth.html#tab-overview"
    Start-Sleep -Milliseconds 500
    Start-Process "http://localhost:8088/cluster"
    Start-Sleep -Milliseconds 500
    Start-Process "http://localhost:9864/datanode.html"
})

$btnHelp.Add_Click({
    $helpForm = New-Object System.Windows.Forms.Form
    $helpForm.Text = "Comprehensive Hadoop Command Dictionary"
    $helpForm.Size = New-Object System.Drawing.Size(750, 600)
    $helpForm.StartPosition = "CenterParent"
    
    $txtHelp = New-Object System.Windows.Forms.TextBox
    $txtHelp.Multiline = $true
    $txtHelp.Dock = [System.Windows.Forms.DockStyle]::Fill
    $txtHelp.ReadOnly = $true
    $txtHelp.ScrollBars = "Vertical"
    $txtHelp.Font = New-Object System.Drawing.Font("Consolas", 11)
    $txtHelp.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#1E1E1E")
    $txtHelp.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#58A6FF")
    
    $content = "=========================================================`r`n" +
               "           HADOOP & HDFS COMMAND CHEAT SHEET`r`n" +
               "=========================================================`r`n`r`n" +
               "--- HDFS FILE SYSTEM (BASIC) ---`r`n" +
               "1. List Files:            hdfs dfs -ls /`r`n" +
               "2. List Recursively:      hdfs dfs -ls -R /`r`n" +
               "3. Create Directory:      hdfs dfs -mkdir /mydata`r`n" +
               "4. Create Nested Dir:     hdfs dfs -mkdir -p /mydata/logs/2026`r`n" +
               "5. Upload File (Put):     hdfs dfs -put local.txt /mydata/`r`n" +
               "6. Download File (Get):   hdfs dfs -get /mydata/local.txt C:\`r`n" +
               "7. Read File (Cat):       hdfs dfs -cat /mydata/local.txt`r`n" +
               "8. Read End of File:      hdfs dfs -tail /mydata/local.txt`r`n" +
               "9. Delete File:           hdfs dfs -rm /mydata/local.txt`r`n" +
               "10. Delete Directory:     hdfs dfs -rm -r /mydata`r`n`r`n" +
               "--- HDFS FILE SYSTEM (ADVANCED) ---`r`n" +
               "11. Copy within HDFS:     hdfs dfs -cp /src /dest`r`n" +
               "12. Move within HDFS:     hdfs dfs -mv /src /dest`r`n" +
               "13. Append to File:       hdfs dfs -appendToFile local.txt /hdfsfile`r`n" +
               "14. Create Empty File:    hdfs dfs -touchz /mydata/empty.txt`r`n" +
               "15. Check File Size:      hdfs dfs -du -h /mydata`r`n" +
               "16. Check Free Space:     hdfs dfs -df -h`r`n" +
               "17. Count Files & Dirs:   hdfs dfs -count /mydata`r`n" +
               "18. Change Permissions:   hdfs dfs -chmod 777 /mydata`r`n" +
               "19. Change Ownership:     hdfs dfs -chown user:group /mydata`r`n" +
               "20. Change Replication:   hdfs dfs -setrep -w 2 /mydata/local.txt`r`n`r`n" +
               "--- HADOOP ADMINISTRATION ---`r`n" +
               "21. Cluster Storage Rep:  hdfs dfsadmin -report`r`n" +
               "22. Enter Safe Mode:      hdfs dfsadmin -safemode enter`r`n" +
               "23. Leave Safe Mode:      hdfs dfsadmin -safemode leave`r`n" +
               "24. Check Safe Mode:      hdfs dfsadmin -safemode get`r`n" +
               "25. Format NameNode:      hdfs namenode -format`r`n`r`n" +
               "--- YARN & MAPREDUCE ---`r`n" +
               "26. List Active Nodes:    yarn node -list`r`n" +
               "27. List Running Apps:    yarn application -list`r`n" +
               "28. Kill Application:     yarn application -kill <App_ID>`r`n" +
               "29. Get App Logs:         yarn logs -applicationId <App_ID>`r`n" +
               "30. List MapReduce Jobs:  mapred job -list`r`n`r`n"
    
    $txtHelp.Text = $content
    $helpForm.Controls.Add($txtHelp)
    $helpForm.ShowDialog() | Out-Null
})

$btnOpenTerm.Add_Click({
    LogMessage "Launching interactive Native Hadoop Terminal..."
    $procInfo = New-Object System.Diagnostics.ProcessStartInfo
    $procInfo.FileName = "cmd.exe"
    $procInfo.Arguments = "/k `"title Native Hadoop CLI & color 0A & echo ============================================== & echo   HADOOP NATIVE CLI TERMINAL READY & echo ============================================== & echo. & echo Type your Hadoop commands here directly (e.g. hdfs dfs -ls /)`""
    $procInfo.UseShellExecute = $true
    
    # Inject exact environment variables so hdfs cmd finds Java and Hadoop
    [Environment]::SetEnvironmentVariable("JAVA_HOME", $env:JAVA_HOME, "Process")
    [Environment]::SetEnvironmentVariable("HADOOP_HOME", $env:HADOOP_HOME, "Process")
    [Environment]::SetEnvironmentVariable("Path", $env:Path, "Process")
    
    $proc = New-Object System.Diagnostics.Process
    $proc.StartInfo = $procInfo
    $proc.Start() | Out-Null
})

$form.Add_Shown({
    LogMessage "Full-Stack Manager initialized."
    UpdateStatus
})

$form.ShowDialog() | Out-Null
