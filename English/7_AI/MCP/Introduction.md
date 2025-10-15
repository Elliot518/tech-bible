[Back](README.md)

## MCP(Model Context Protocol)

<hr>


### 1. What is MCP

> The Model Context Protocol (MCP) is an open-source standard developed by Anthropic (released in 2024) that enables seamless, secure integration between large language models (LLMs) and external data sources, tools, and workflows. Often called the "USB-C for AI," it standardizes how AI agents like Claude, ChatGPT, or Gemini connect to real-world systems—such as databases, file systems, APIs, or apps—without custom, fragmented integrations. This addresses key LLM limitations: static knowledge (frozen at training) and isolation from live data/actions.

_MCP powers context-aware AI agents that can fetch real-time info, execute tasks (e.g., update a CRM or query a database), and maintain security boundaries, making AI more practical for enterprise and developer use._


#### What is an AI Agent?
> An AI Agent is an autonomous software system powered by large language models (LLMs) that perceives its environment, makes decisions, and takes actions to achieve specific goals—without constant human intervention. Unlike basic chatbots that just respond, AI agents act in the real world: booking flights, debugging code, managing emails, or trading stocks.

&nbsp;

### 2. How MCP Works

> MCP uses a client-server architecture over JSON-RPC 2.0, with transports like stdio, HTTP, or Server-Sent Events (SSE). It builds on function calling (tool use) but adds standardized context handling.


- **MCP Server**
  - Exposes data/tools/prompts from external sources. Acts as a "bridge" to resources like files, databases, or APIs.
  _(eg:A server connecting to Google Calendar, allowing an AI to check events and book meetings.)_

- **MCP Client**
  - AI application (e.g., Claude) that queries the server, invokes tools, and interpolates prompts with retrieved context.
  _(ChatGPT pulling live stock data from a finance API to answer "What's my portfolio worth today?")_

<hr>

- **Flow Example:**

  1. User queries AI: "Book a flight to NYC next week."
  2. Client (AI) routes to MCP server.
  3. Server fetches calendar data → AI selects dates → Invokes flight API tool.
  4. AI confirms: "Flight booked for Oct 22 via Delta."
    _Security: Supports OAuth/TLS; servers control access, preventing unauthorized data exposure._

&nbsp;

### 3. Doc to get started


1. Docs & Spec: modelcontextprotocol.io – Tutorials, SDKs (Python, C#, etc.).
2. GitHub: github.com/modelcontextprotocol – Servers registry, examples.
