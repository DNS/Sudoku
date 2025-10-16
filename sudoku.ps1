
function solveSudoku {
	param ($board)
	
	solve $board
}

function solve {
	param ($board)
	
	for ($row = 0; $row -lt 9; $row++) {
		for ($col = 0; $col -lt 9; $col++) {
			if ($board[$row][$col] -eq '.') {
				for ($num = 1; $num -le 9; $num++) {
					if (isValid $board $row $col $num) {
						$board[$row][$col] = $num;
						if (solve $board) { 
							return $true
						}
						$board[$row][$col] = '.';
					}
				}
				return $false
			}
		}
	}
	
	PrintBoard $board
	return $true;
}

function isValid  {
	param ($board, $row, $col, $num)
	$num = [string] $num
	
	for ($i = 0; $i -lt 9; $i++) {
		if ($($board[$row][$i] -eq $num) -or $($board[$i][$col] -eq $num)) { 
			return $false
		}
	}
	
	$startRow = [Math]::Floor($row / 3) * 3;
	$startCol = [Math]::Floor($col / 3) * 3;
	
	for ($i = $startRow; $i -lt $startRow + 3; $i++) {
		for ($j = $startCol; $j -lt $startCol + 3; $j++) {
			if ($board[$i][$j] -eq $num) {
				return $false
			}
		}
	}
	return $true;
}

function PrintBoard {
	param ($board)
	
	for ($i = 0; $i -lt 9; $i++) {
		#for ($j = $startCol; $j -lt 9; $j++) {
			Write-Host $($board[$i] -join '')
		#}
	}
}

$b = @(
	@('5','3','.','.','7','.','.','.','.'),
	@('6','.','.','1','9','5','.','.','.'),
	@('.','9','8','.','.','.','.','6','.'),
	@('8','.','.','.','6','.','.','.','3'),
	@('4','.','.','8','.','3','.','.','1'),
	@('7','.','.','.','2','.','.','.','6'),
	@('.','6','.','.','.','.','2','8','.'),
	@('.','.','.','4','1','9','.','.','5'),
	@('.','.','.','.','8','.','.','7','9')
)

$b = @(
	@(".",".",".",".",".",".",".",".","."),
	@(".", "9", ".", ".", "1", ".", ".", "3", "."),
	@(".", ".", "6", ".", "2", ".", "7", ".", "."),
	@(".", ".", ".", "3", ".", "4", ".", ".", "."),
	@("2", "1", ".", ".", ".", ".", ".", "9", "8"),
	@(".", ".", ".", ".", ".", ".", ".", ".", "."),
	@(".", ".", "2", "5", ".", "6", "4", ".", "."),
	@(".", "8", ".", ".", ".", ".", ".", "1", "."),
	@(".", ".", ".", ".", ".", ".", ".", ".", ".")
)

solveSudoku $b | Out-Null



