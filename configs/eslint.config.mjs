import { defineConfig } from "eslint/config";
import typescriptEslint from "@typescript-eslint/eslint-plugin";
import tsParser from "@typescript-eslint/parser";

export default defineConfig([
	{
		plugins: { "@typescript-eslint": typescriptEslint },
		languageOptions: { parser: tsParser },
		rules: {
			"@typescript-eslint/consistent-type-imports": "error",
		},
	},
	{
		files: ["**/*.js", "**/*.ts", "**/*.tsx", "**/*.mts", "**/*.cts"],
	},
]);
