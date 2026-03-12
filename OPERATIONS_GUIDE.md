---
author: Tessa AI Labs
title: Knowledge Ingestion Protocol (KIP)
type: Technical Documentation
version: 1.0.0
---

# 🧠 Knowledge Ingestion Protocol (KIP)

Данный документ описывает алгоритм наполнения базы знаний ИИ-агента Тесса, процесс очистки данных и синхронизации с публичным репозиторием.

## 🏛 1. Архитектура системы
Все данные хранятся в изолированной директории, защищенной от системных файлов агента:
- **Локальный путь:** `/root/.openclaw/workspace/Knowledge_Vault/`
- **Структура:** Каждому автору соответствует отдельная директория `Author_Name/`.

## ⚙️ 2. Скрипт-санитар (cleaner.js)
Для обработки литературы используется Node.js скрипт, который выполняет:
1. **Sanitization:** Удаление лицензионного мусора Project Gutenberg.
2. **Metadata Injection:** Добавление YAML-заголовков (автор, название, источник).
3. **Formatting:** Приведение стихов к стандарту Markdown (двойные пробелы для переноса строк).
4. **Auto-Sync:** Автоматический `git commit` и `git push` на GitHub.

## 🚀 3. Операционный цикл (Terminal Commands)

### Загрузка новой книги:
```bash
wget -O /root/raw_file.txt "URL_GUTENBERG"
