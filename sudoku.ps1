
<#

$b = @(
    @(1, 2, 3),
    @(2, 3, 1),
    @(3, 1, 2)
)
	123
	231
	312



$b = @(
    @(1, '.', '.'),
    @('.', '.', '.'),
    @('.', '.', 2)
)
#>

$Global:board = @(
    @(1, 2, 3),
    @(2, 3, 1),
    @(3, '.', 2)
)

function Pick-Num {
	param ($row, $col)
	
	$nums = [System.Collections.ArrayList]::new(1..3)
	
	for ($r = 0; $r -lt 3; $r++) {
		if ($b[$r][$col] -ne '.') {
			$nums.Remove( $b[$r][$col] )
		}
	}
	
	for ($c = 0; $c -lt 3; $c++) {
		if ($b[$row][$c] -ne '.') {
			$nums.Remove( $b[$row][$c] )
		}
	}
	
	return $nums[0]
}

function Is-Valid {
	param ($row, $col, $n)
	
	$q = $(1..3 | Measure-Object -Sum).Sum

	$t1 = 0
	$b[$row] | %{ if ($_ -ne '.') { $t1 += $_ } }	
	
	if ($t1 -ne $q) { return $false }
	
	$t2 = 0
	for ($r = 0; $r -lt 3; $r++) {
		if ($b[$r][$col] -ne '.') {
			$t2 += $b[$r][$col]
		}
	}
	
	if ($t2 -ne $q) { return $false }
	
	return $true
}

function Find-Empty-Cell {
	for ($i = 0; $i -lt 3; $i++) {
		for ($j = 0; $j -lt 3; $j++) {
			if ($board[$i][$j] -eq '.') {
				return $i, $j
			}
		}
	}
	return
}

function Sudoku-Solver {
	#param ($board)
	
	$empty = Find-Empty-Cell
	if (-not $empty) {
		return $true
	}
	
	$row, $col = $empty
	
	foreach ($n in 1..3) {
		if (Is-Valid $row $col $n) {
			$board[$row][$col] = $n
			if (Sudoku-Solver) {
				return $true
			}
			$board[$row][$col] = '.'
		}
	}
	
	return $false
}

function Print-Board {
	#param ($board)
	for ($i = 0; $i -lt 3; $i++) {
		$board[$i] -join ''
	}
}

#Is-Valid 2 2
#find-empty-cell
Sudoku-Solver | Out-Null
Print-Board



