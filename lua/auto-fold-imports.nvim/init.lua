local function fold()
	local file_type = vim.bo.filetype
	if file_type == "javascript" or file_type == "typescript" then
		local lines = vim.fn.getline(1, "$")
		local search_pattern = "^%s*import%s+[^;\n]+[;\n]"
		local fold_start = nil

		for i, line in ipairs(lines) do
			if line:match(search_pattern) then
				if not fold_start then
					fold_start = i
				end
			elseif fold_start then
				vim.fn.setpos(".", { fold_start, 1, 1, 0 })
				vim.cmd("normal! zf" .. i .. "G")
				fold_start = nil
			end
		end

		if fold_start then
			local last_line = #lines
			vim.fn.setpos(".", { fold_start, 1, 1, 0 })
			vim.cmd("normal! zf" .. last_line .. "G")
		end
	end
end

return {
	fold = fold,
}
