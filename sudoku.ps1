


$board = @(
	@("5","3",".",".","7",".",".",".","."),
	@("6",".",".","1","9","5",".",".","."),
	@(".","9","8",".",".",".",".","6","."),
	@("8",".",".",".","6",".",".",".","3"),
	@("4",".",".","8",".","3",".",".","1"),
	@("7",".",".",".","2",".",".",".","6"),
	@(".","6",".",".",".",".","2","8","."),
	@(".",".",".","4","1","9",".",".","5"),
	@(".",".",".",".","8",".",".","7","9")
)



<#
function Pick-Num {
	param ($row, $col)
	
	$nums = [System.Collections.ArrayList]::new(1..3)
	
	for ($r = 0; $r -lt 9; $r++) {
		if ($b[$r][$col] -ne '.') {
			$nums.Remove( $b[$r][$col] )
		}
	}
	
	for ($c = 0; $c -lt 9; $c++) {
		if ($b[$row][$c] -ne '.') {
			$nums.Remove( $b[$row][$c] )
		}
	}
	
	return $nums[0]
}
#>

function Is-Valid {
	param ($row, $col, $num)
	#write-host $num
	# row check
	for ($c = 0; $c -lt 9; $c++) {
		if ($board[$row][$c] -eq $num) {
			return $false
		}
	}

	# column check
	for ($r = 0; $r -lt 9; $r++) {
		if ($board[$r][$col] -eq $num) {
			return $false
		}
	}
	
	return $true
}

function Find-Empty-Cell {
	for ($i = 0; $i -lt 9; $i++) {
		for ($j = 0; $j -lt 9; $j++) {
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
	
	foreach ($n in 1..9) {
		if (Is-Valid $row $col $n) {
			
			$board[$row][$col] = [string] $n
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
	#$board
	for ($i = 0; $i -lt 9; $i++) {
		$board[$i] -join ''
	}
	
}

#Is-Valid 2 1 1
Sudoku-Solver | Out-Null
Print-Board



