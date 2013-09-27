module Paths_Workflow (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,8,0,7], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "C:\\Users\\magocoal\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\magocoal\\AppData\\Roaming\\cabal\\Workflow-0.8.0.7\\ghc-7.4.2"
datadir    = "C:\\Users\\magocoal\\AppData\\Roaming\\cabal\\Workflow-0.8.0.7"
libexecdir = "C:\\Users\\magocoal\\AppData\\Roaming\\cabal\\Workflow-0.8.0.7"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "Workflow_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Workflow_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Workflow_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Workflow_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
