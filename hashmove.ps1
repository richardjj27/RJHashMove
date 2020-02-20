$count_of_things = 4
$focus_thread = 1
$current_folder = "C:\Users\richardjoh\Documents\Projects\hashmove\testfolder"
$destination_folder = "C:\Users\richardjoh\Documents\Projects\hashmove\destination"
function destination_bucket
{
  Param([string]$file_name)
  # Init the sum to zero
  $sum = 0

  # Turn the string into ascii list
  $x = [int[]][Char[]]$file_name

  # Sum of the list of ascii
  $x | Foreach { $sum += $_}
  $destination_bucket = $sum % $count_of_things + 1
  return $destination_bucket
}

$files = Get-ChildItem $current_folder
foreach ($f in $files)
{
  $target_dir1 = "$destination_folder"
  $target_dir2 = destination_bucket($f.fullName)
  write-host $f
  # if destination_bucket = $focus_thread, process the file
    Move-Item $current_folder\$f $target_dir1\$target_dir2
    #move the file with copydat
    #some kind of check or log?
    #delete the file
}
