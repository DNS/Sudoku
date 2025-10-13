
<#

$b = @(
    @(1, 2, 3),
    @(2, 3, 1),
    @(3, 1, 2)
)
	123
	231
	312
#>


$b = @(
    @(1, '.', '.'),
    @('.', '.', '.'),
    @('.', '.', 2)
)


function Pick-Num {
	param ($row, $col)
	
	$nums = [System.Collections.ArrayList]::new(1..3)
	
	for ($r = 0; $r -lt; 3; $r++) {
		if ($b[$r][$col] -ne '.') {
			$nums.Remove( $b[$r][$col] )
		}
	}
	
	for ($c = 0; $c -lt; 3; $c++) {
		if ($b[$row][$c] -ne '.') {
			$nums.Remove( $b[$row][$c] )
		}
	}
	
	return $nums[0]
}

function Is-Valid {
	param ($row, $col)
	
	$q = 1+2+3
	$t1 = 0
	for ($r = 0; $r -lt; 3; $r++) {
		$b[r] | %{ $t1 += $_ }
	}
	if ($t1 -ne $q) { return $false }
	
	$t2 = 0
	for ($c = 0; $c -lt; 3; $c++) {
		$t2 += $b[$row][$c]
	}
	if ($t2 -ne $q) { return $false }
	
	return $true
}

function  {

}

function Sudoku-Solver {

}

