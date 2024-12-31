class ApiErrorMessages {
  // Mapping common HTTP status codes to error messages
  static const Map<int, String> httpStatusMessages = {
    400: "Bad Request. The server could not understand the request.",
    401: "Unauthorized. Please check your credentials.",
    403: "Forbidden. You don't have permission to access this resource.",
    404: "Not Found. The resource you're looking for doesn't exist.",
    500: "Internal Server Error. Something went wrong on the server.",
    502: "Bad Gateway. The server received an invalid response from the upstream server.",
    503: "Service Unavailable. The server is currently unavailable.",
    504: "Gateway Timeout. The server didn't respond in time.",
    415: "Unsupported Media Type. The requested media type is not supported.",
    // Add more HTTP status codes as needed
  };

  // Custom API error messages for specific scenarios
  static const String timeoutError = "Request timed out. Please try again later.";
  static const String networkError = "No internet connection. Please check your network.";
  static const String unknownError = "An unknown error occurred. Please try again.";
  static const String parseError = "Failed to parse the response from the server.";

  // Helper method to get an error message by status code
  static String getMessageFromStatusCode(int? statusCode) {
    return httpStatusMessages[statusCode] ?? unknownError;
  }
}
