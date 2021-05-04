$RepairToolButton_Click = {
	$RepairToolButton.Enabled = $false
	${function:repairtool}
}
$DataCollectorButton_Click = {
	$DataCollectorButton.Enabled = $false
	${function:datacollector}
}
$LauncherWindow_Load = {
}

$AcceptCheckbox_CheckedChanged = {
	if ($AcceptCheckBox.Checked) { $DataCollectorButton.Visible = $true }
	else { $DataCollectorButton.Visible = $false }
	if ($AcceptCheckBox.Checked) { $RepairToolButton.Visible = $true }
	else { $RepairToolButton.Visible = $false }
}

function repairtool {
(& ".\SCST.ps1")
}

function datacollector {
(& ".\SCSTCOLLECTDATA.ps1")
}

datacollector

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'loader.designer.ps1')
$LauncherWindow.ShowDialog()

