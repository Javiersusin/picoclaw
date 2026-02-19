# build_android.ps1
# Compila PicoClaw como libreria compartida .so para Android ARM64

$NDK = "C:\Users\javis\AppData\Local\Android\Sdk\ndk\29.0.14206865"
$CLANG = "$NDK\toolchains\llvm\prebuilt\windows-x86_64\bin\aarch64-linux-android26-clang.cmd"
$OUTPUT = "build\android\arm64\libpicoclaw.so"

$env:GOOS = "android"
$env:GOARCH = "arm64"
$env:CGO_ENABLED = "1"
$env:CC = $CLANG

Write-Host "Compilando PicoClaw para Android ARM64..." -ForegroundColor Cyan

go build -buildmode=c-shared -o $OUTPUT ./cmd/picoclaw

if ($LASTEXITCODE -eq 0) {
    Write-Host "OK! Generado: $OUTPUT" -ForegroundColor Green
} else {
    Write-Host "ERROR en la compilacion. Revisa el log." -ForegroundColor Red
}
