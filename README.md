# AFKPAL Mobile Cloud Phone  
Next-Generation Cloud Phone with Performance Benchmarking, Emulator Support & GitHub CI/CD Automation

---

## 📱 Cloud Phone Specifications

| Spec | Details |
|------|---------|
| OS | Android (Latest Version) |
| Resolution | 1440×3440 |
| Density | 507 PPI |
| CPU | Snapdragon 8 Elite |
| GPU | Adreno 830 |
| RAM | 16 GB |
| ROM (Storage) | 1 TB |
| Battery | 7950 mAh |
| Refresh Rate | 165 Hz |
| Bluetooth | 5.4 |
| Charging | Fast Charging 55W |

---

## 🚀 Features
✔ Cloud Phone boot & connection via ADB  
✔ Full CI/CD build pipeline (APK Build + Deploy)  
✔ Automatic FPS / CPU / ROM / Thermal benchmark  
✔ Performance Health Report (GitHub Actions)  
✔ Logs auto-uploaded as artifacts  
✔ Production-ready GitHub workflows  

---

## 🧪 Benchmark Scripts

| File | Purpose |
|------|---------|
| `adb-connect.sh` | Connect Cloud Phone to GitHub |
| `cloud-benchmark.sh` | CPU / GPU / Storage analysis |
| `performance-test.sh` | FPS / Thermal / Battery test |
| `factory-reset.sh` | Restore device to factory defaults |
| `cloud-connect.sh` | ADB IP connection method |

---

## ⚙ GitHub CI/CD Workflows

| Workflow File | Description |
|---------------|-------------|
| `build-apk.yml` | Builds APK via Gradle |
| `boot-cloud-phone.yml` | Starts Cloud Phone + 55W charging |
| `test-emulator.yml` | Runs performance tests & logs |
| `deploy-release.yml` | Deploys APK to GitHub Releases |

---

## 📦 Analyze Performance (Auto Health Report)

```yaml
- name: Analyze Performance
  run: bash scripts/analyze-performance.sh
