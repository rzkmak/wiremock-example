# Wiremock Example

Sample usage of wiremock for stubbing dependency server.

Study case: https://jsonplaceholder.typicode.com/posts/

## Background

When we have a third party dependency, we should be aware that in development we can't relly 100% on their APIs, especially for simulating fault. So we need to setup our own implementation for stubbing HTTP Requests. Wiremock, has been widely known as one of HTTP mock that have rich feature for simulating real-world scenario. 

Reference: https://wiremock.org/docs/

## How to Run

```
make run-mock

# on different terminal session
make init-config
```

## Case Simulation

### Latency for Normal Request

- Median: 300ms
- Standard Deviation: 0.5

| Percentile  | Avg Response Time (ms)|
| ----------- | ----------- |
| 10th | 43.8798 |
| 25th | 109.076|
| 50th | 300. |
| 75th | 825.11 |
| 90th | 2051.06 |

Reference: https://www.wolframalpha.com/input?i=lognormaldistribution%28log%28300%29%2C+1.5%29

### Simulating Error Response

| Post ID  | Result |
| ----------- | ----------- |
| 10 | 503 - Service Unavailable |
| 20 | 404 - Not Found |
| 30 | 500 - Internal Server Error |
| 40 | 400 - Bad Request |

### Simulating Specific Latency

| Post ID  | Delay |
| ----------- | ----------- |
| 50 | 500ms |
| 60 | 1s |
| 70 | 5s |
| 80 | 10s |
| 90 | 30s |

## Benchmarking

For testing delay we can use Apache Bench: https://httpd.apache.org/docs/2.4/programs/ab.html

It is installed by default on Mac OS

Usage Example
```
# fixed delay simulation
ab -n 1 localhost:9999/posts/50

# dynamic delay simulation
ab -n 10 localhost:9999/posts/1
```

## Roadmap
- [x] setup mapping for GET request
- [x] add delay simulation
- [x] add special case simulation
- [x] performance test / benchmark embedded in project
- [ ] setup mapping for POST request
- [ ] setup mapping for PATCH request
- [ ] setup mapping for DELETE request
- [ ] add response templating for POST/PATCH/DELETE
- [ ] add response templating for 404
